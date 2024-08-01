#Creating a VPC for our project

resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

#Here we create a subnet1 for the VPC
resource "google_compute_subnetwork" "subnet1" {
  name          = "${var.suffix}-subnet1"
  ip_cidr_range = "10.0.0.0/22"
  region        = var.subnet1_region
  network       = google_compute_network.vpc_network.id
}


#Here we create a subnet2 for the VPC
resource "google_compute_subnetwork" "subnet2" {
  name          = "${var.suffix}-subnet1"
  ip_cidr_range = "10.0.4.0/22"
  region        = var.subnet2_region
  network       = google_compute_network.vpc_network.id
}



