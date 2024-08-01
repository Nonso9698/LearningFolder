# Create the first bucket
resource "google_storage_bucket" "bucket" {
  name     =  "${var.suffix}-kings01"
  location = var.location
}

# Upload userdata.sh to the first bucket
resource "google_storage_bucket_object" "userdata" {
  name   = "userdata.sh"
  bucket = google_storage_bucket.bucket.name
  source = "${path.module}/userdata.sh"
}


/*
# Create the second bucket
resource "google_storage_bucket" "bucket1" {
  name     = "kingsleybucket162"
  location = "US"
}

# Upload userdata1.sh to the second bucket
resource "google_storage_bucket_object" "userdata1" {
  name   = "userdata1.sh"
  bucket = google_storage_bucket.bucket1.name
  source = "${path.module}/userdata1.sh"
}
*/