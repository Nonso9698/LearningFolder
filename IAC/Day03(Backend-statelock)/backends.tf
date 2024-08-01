
terraform {
backend "gcs" {
bucket  = "nonsobucket1" 
prefix  = "terraform/gce/state"
 } 
}