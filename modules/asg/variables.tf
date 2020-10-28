variable "vpc_id" {
  description = "A VPC identifier must be supplied."
}

variable "ami_id" {
  description = "Defines the AMI id used to launch EC2 instances"
}

variable "instance_type" {
  description = "Defines the EC2 instance type"
  default     = "t2.micro"
}

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance."
}

variable "min_size" {
  description = "The minimum number of instances."
  default     = 2
}

variable "max_size" {
  description = "The maximum number of instances."
  default     = 2
}

variable "vpc_zone_identifier" {
  default = "List of subnet IDs to use."
}

variable "health_check_type" {
  default = "ELB"
}

variable "allowed_hosts" {
  description = "CIDR blocks of trusted networks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "internal_networks" {
  type        = list(string)
  description = "Internal network CIDR blocks."
}

variable "load_balancers" {
  description = "Elasctic Load Balancers to use."
}

variable "environment" {
  default = "The Environment name to use."
}
