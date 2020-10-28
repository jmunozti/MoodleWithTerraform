variable "vpc_cidr" {
  description = "Defines the VPC's CIDR block"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "Defines the tenancy option for instances into the VPC."
  default     = "default"
}

variable "vpc_id" {
  description = "A VPC identifier must be supplied."
}

variable "public_subnet_cidr" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "public_subnet2_cidr" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.3.0/24"
}

variable "public_subnet_cidr2" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr" {
  description = "Defines a private subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "availability_zone_1" {
  description = "Defines an Availability_zone to start the instance in"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Defines an Availability_zone to start the instance in"
  default     = "us-east-1b"
}

variable "enable_dns_support" {
  default = true
}
variable "enable_dns_hostnames" {
  default = true
}

variable "environment" {
  default = "The Environment name to use."
}
