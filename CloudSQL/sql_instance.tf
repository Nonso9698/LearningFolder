# Define Google Cloud SQL database instance using the private subnet
resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = true
      private_network = "projects/kingsleyproject-427719/global/networks/cloudsqlvpc"
    }
  }

  deletion_protection = true

  depends_on = [
    google_compute_subnetwork.private_subnet,
    google_compute_subnetwork.public_subnet,
  ]
}