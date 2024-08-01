terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.37.0"
    }
  }
}

provider "google" {
   region    = "us-central1"
   project   = "kingsleyproject-427719"
}


variable "servername" {
    description = "This is the servername"
}

variable "image" {
    description = "This is the image"
}

variable "machine_type" {
    description = "This is the machine type"
     type = map(string)

     default = {
      "dev" = "e2.micro"
      "stage" = "e2.small"
      "prod" = "e2.medium"
    }
}

variable "instance_zone" {
    description = "This is the instance_zone"
}

variable "environment" {
  description = "Environment to deploy (dev, stage, prod)"
  type        = string
  default     = "dev"  // Set default environment if not specified
}

resource "google_compute_instance" "ubuntu-server" {
  name         = var.servername
  machine_type = var.machine_type[var.environment]
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "regions/us-central1/subnetworks/default"

    access_config {
      // Ephemeral public IP
    }
  }
}

