
variable "primary_project" {
    description = "Houses project for this module"
}

variable "primary_region" {
    description = "Houses region for this project"
}

variable "subnet1_region" {
  description = "The region for subnet2"
  type        = string
}


variable "vpcname" {
  description = "The region for vpcname"
  type        = string
}


variable "firewallname" {
  description = "The region for firewallname"
  type        = string
}

variable "machine_type" {
    description = "House machine type"
}

variable "servername" {
    description = "House gcs name"
}

variable "instance_zone" {
    description = "House default zone"
}

variable "image" {
    description = "House machine image"
}

variable "suffix" {
  description = "The region for vpcname"
  default = "nonso"
}

variable "private_key_path" {
  default = "~/.ssh/my-terraform-key"
}

variable "public_key_path" {
  description = "Path to the SSH public key file"
  default     = "~/.ssh/my-terraform-key.pub"
}