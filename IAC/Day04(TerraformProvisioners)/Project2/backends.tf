terraform {
backend "gcs" {
bucket  = "nonsobucket1" 
prefix  = "terraform/gcs2/state"
 } 
}