variable "vpc_id" {
  description = "A VPC identifier must be supplied."
}

variable "subnet_id" {
  description = "Defines the subnet ID where the ELB will be launched"
}

variable "cross_zone_load_balancing" {
  description = "Defines if cross zone load balancing must be enables or not."
  default     = true
}

variable "environment" {
  description = "The Environment name to use."
}

variable "internal" {
  description = "Defines if an ELB must be private or public."
  default     = false
}

variable "connection_draining" {
  description = "Defines if the connection draining must be enabled or not"
  default     = true
}
