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
  name          = "${var.suffix}-subnet2"
  ip_cidr_range = "10.0.4.0/22"
  region        = var.subnet2_region
  network       = google_compute_network.vpc_network.id
}


#Here we create a firewall to allow icmp(ping), tcp and also ssh into our servers

# Firewall Rule
# Here we create a firewall to allow icmp(ping), tcp and also ssh into our servers
# Here we create a firewall to allow icmp(ping), tcp and also ssh into our servers
resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  } 

  allow {
    protocol = "tcp"
    ports    = ["22"]  # SSH port
  } 

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allow traffic from all IP addresses; restrict as needed
}
