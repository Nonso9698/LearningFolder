variable "primary_project" {
    description = "This is my primary project"
    type = string
}

variable "secondary_project" {
    description = "This is my secondary project"
    type = string
    default = "kenscott"
}

variable "primary_region" {
    description = "This will always be my primary region"
    type = string
}

variable "secondary_region" {
    description = "This will always be my secondary region"
    type = string 
}

variable "location" {
    description = "This will always be my location"
    type = string
    default = "US"   
}

variable "suffix" {
  description = "The suffix to append to anything"
  type        = string
  default     = "nonso"
}


variable "machine_type" {
    description = "This will be my default machine type"
    type = string  
}

variable "ubuntu" {
    description = "This will be my default ubuntu image"
    type = string 
}

variable "disk_size_gb" {
    description = "This will be my default disk size"
    type = number
}

variable "disk_type" {
  description = "This will be the default disk type"
  type = string
}

variable "metadata" {
  description = "This will be the default script"
  type = string
}

variable "http" {
  description = "This will be the default http port"
  type = number
}


variable "html" {
    description = "This will always be index.html path"
    type = string
}

variable "subnet1_region" {
  description = "The region for subnet2"
  type        = string
}


variable "subnet2_region" {
  description = "The region for subnet2"
  type        = string
}
