# Instance template 1
resource "google_compute_instance_template" "lb_instance_template_1" {
  name        = "${var.suffix}-channel"
  description = "Instance template for load balancer instances"
  machine_type = var.machine_type  # Specify the machine type for the instances
  
  disk {
    source_image = var.ubuntu
    disk_size_gb = var.disk_size_gb
    disk_type = var.disk_type
  }
  
  network_interface {
    subnetwork = google_compute_subnetwork.subnet1.id  # Specify the subnet
    access_config {
      // Optionally specify an external IP
    }
  }

  metadata_startup_script = var.metadata 

}
/*
#Instance template 2

resource "google_compute_instance_template" "lb_instance_template_2" {
  name        = "terraform-project-server"
  description = "Instance template for load balancer instances"
  machine_type = "e2-micro"  # Specify the machine type for the instances
  
  disk {
    source_image = "ubuntu-2004-focal-v20240209"
    disk_size_gb = 10
    disk_type = "pd-standard"
  }
  
  network_interface {
    network = google_compute_network.vpc_network.id
  }

  metadata = {
    user-data = base64encode(file("${path.module}/userdata1.sh"))
  }
}
*/