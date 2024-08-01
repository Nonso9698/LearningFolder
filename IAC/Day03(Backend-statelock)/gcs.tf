provider "google" {
  project = var.project
  region  = var.region
}


resource "google_storage_bucket" "statebucket1" {
  name          = var.bucketname
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

  }




