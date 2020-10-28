
variable "region" {
  description = "Defines the AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Defines the VPC's CIDR block"
  default     = "10.0.0.0/16"
}

variable "tenancy" {
  description = "Defines the tenancy option for instances into the VPC."
  default     = "default"
}

variable "public_subnet_cidr" {
  description = "Defines a public subnet CIDR"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "Defines a private subnet CIDR"
  default     = "10.0.1.0/24"
}

variable "ssh_key" {
  description = "The key name of the Key Pair to use for the instance."
  default     = "bastion"
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Defines the AMI id used to launch EC2 instances"
  default     = "ami-08f3d892de259504d"
}

variable "ec2_count" {
  description = "Defines the number of EC2 instances"
  default     = "1"
}

variable "min_size" {
  description = "The minimum number of instances."
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances."
  default     = 2
}

variable "vpc_zone_identifier" {
  default = "List of subnet IDs to use."
}

variable "health_check_type" {
  default = "EC2"
}

variable "environment" {
  default = "The Environment name to use."
}

variable "elb_is_internal" {
  default = false
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

variable "zone_id" {
  default = "Z08674413IL1AXNROVPX6"
}

variable "ttl" {
  default = "60"
}
