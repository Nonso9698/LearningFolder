provider "google" {
  project     = var.primary_project
  region      = var.primary_region
}


module "create_vpc" {
  source = "../../GCE/modules/vpc"

  primary_project = var.primary_project
  primary_region  = var.primary_region
  subnet1_region  = var.subnet1_region
  subnet2_region  = "us-central1"
  suffix          = var.suffix
}




