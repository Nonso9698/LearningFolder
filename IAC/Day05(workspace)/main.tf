
variable "servername" {
    description = "This is the servername"
}

variable "image" {
    description = "This is the image"
}

variable "machine_type" {
    description = "This is the machine type"
     type = map(string)

  default = {
    "dev" = "e2-micro "
    "stage" = "e2-small"
    "prod" = "e2-medium"
  }
}

variable "instance_zone" {
    description = "This is the instance_zone"
}


module "gce" {

    source = "./modules/gce"
    image = var.image
    machine_type = var.machine_type
    servername = var.servername
    instance_zone = var.instance_zone
  
}

