
resource "google_compute_instance" "ubuntu-server" {
  name         = var.servername
  machine_type = var.machine_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name  
    subnetwork = google_compute_subnetwork.subnet1.name

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = google_compute_instance.ubuntu-server.network_interface[0].access_config[0].nat_ip
  }

  // File provisioner to copy a file from local to the remote instance
  provisioner "file" {
    source      = "./index.sh"  # Path to your local file
    destination = "/home/ubuntu/index.sh"  # Path on the remote instance
  }

  // Remote execution provisioner to configure the file and run commands
  provisioner "remote-exec" {
    inline = [
       "chmod +x /home/ubuntu/index.sh",  # Ensure the script is executable
       "sudo /home/ubuntu/index.sh",      # Execute the script with sudo
    ]
  }

  // Ensure that the provisioners wait until the instance is fully created
  provisioner "remote-exec" {
    inline = [
      "sleep 30"
    ]
  }
}

// Local resource to ensure the local file has the right permissions
resource "null_resource" "prepare_local_file" {
  provisioner "local-exec" {
    command = "chmod 755 index.sh"
  }

  // Ensure this runs before the instance provisioners
  depends_on = [google_compute_instance.ubuntu-server]
}
