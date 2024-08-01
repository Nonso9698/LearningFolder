terraform {
backend "gcs" {
bucket  = "nonsobucket1" 
prefix  = "terraform/gcs1/state"
 } 
}