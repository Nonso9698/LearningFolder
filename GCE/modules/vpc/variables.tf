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

variable "subnet2_region" {
  description = "The region for subnet2"
  type        = string
}

variable "suffix" {
  description = "The suffix to append to anything"
  type        = string
  default     = "nonso"
}