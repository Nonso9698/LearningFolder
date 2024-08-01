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


