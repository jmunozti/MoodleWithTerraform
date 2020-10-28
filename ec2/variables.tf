variable "vpc_id" {
  description = "A VPC identifier must be supplied."
}

variable "subnet_id" {
  description = "Defines the subnet ID where the EC2 instance will be launched"
}

variable "ami_id" {
  description = "Defines the AMI id used to launch EC2 instances"
}

variable "ec2_count" {
  description = "Defines the number of EC2 instances"
  default     = "1"
}

variable "instance_type" {
  description = "Defines the EC2 instance type"
  default     = "t2.micro"
}

variable "private_subnet_cidr" {
  description = "Defines a private subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "availability_zone_1" {
  description = "Defines an Availability_zone to start the instance in"
  default     = "us-east-1b"
}

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance."
}

variable "environment" {
  default = "The Environment name to use."
}
