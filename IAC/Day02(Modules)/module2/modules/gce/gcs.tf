resource "google_compute_instance" "default" {
  name         = "${var.myname}-${var.name}"
  machine_type = var.machine_type
  zone         = var.instance_zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.vpc


    access_config {
      // Ephemeral public IP
    }
  }
metadata_startup_script = file("${path.module}/userdata.sh")

}


