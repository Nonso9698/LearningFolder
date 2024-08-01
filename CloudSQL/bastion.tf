# Define your Baston instance in the public subnet
resource "google_compute_instance" "baston-host" {
  name         = "baston-host"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "your-username:ssh-rsa your-ssh-public-key"
  }
}
