provider "google" {
  project = "nonsoproject"
  region  = "us-central1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "mybucket" {
  name          = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.mybucket.name

  role    = "roles/storage.objectViewer"
  members = [
    "user:kelvinscottndu@gmail.com",
  ]

  # depends_on = [google_storage_bucket.mybucket]
}

