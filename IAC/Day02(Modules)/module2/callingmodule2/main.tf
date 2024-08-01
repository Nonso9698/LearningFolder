terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

provider "google" {
   region    = "us-central1"
   project   = "kingsleyproject-427719"
}



module "gce" {
    source = "../modules/gce"

machine_type    = var.machine_type
name            = var.name
image           = var.image
vpc             = var.vpc
myname          = var.myname
instance_zone   = var.instance_zone

}