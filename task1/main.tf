provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

module "vpc" {
  source              = "../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  tenancy             = var.tenancy
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
}

module "bastion" {
  source            = "../modules/bastion"
  subnet_id         = module.vpc.public_subnet_id
  ssh_key           = var.ssh_key
  internal_networks = [var.private_subnet_cidr]
  environment       = var.environment
}

module "elb" {
  source      = "../modules/elb"
  vpc_id      = module.vpc.vpc_id
  subnet_id   = module.vpc.public_subnet2_id
  environment = var.environment
  internal    = var.elb_is_internal
}

module "asg" {
  source              = "../modules/asg"
  vpc_id              = module.vpc.vpc_id
  ami_id              = data.aws_ami.amazon-linux-2.id
  instance_type       = var.instance_type
  ssh_key             = var.ssh_key
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = module.vpc.private_subnet_id
  health_check_type   = var.health_check_type
  internal_networks   = [var.private_subnet_cidr]
  load_balancers      = module.elb.elb_name
  environment         = var.environment
}

module "rds" {
  source                     = "../modules/rds"
  rds_subnets_ids            = [module.vpc.public_subnet_id, module.vpc.public_subnet2_id]
  zone_id                    = var.zone_id
  ttl                        = var.ttl
  rds_vpc_security_group_ids = [module.asg.security_group]
}

resource "aws_route53_record" "elb_endpoint" {
  name    = "elb.moodlewithterraform.ml"
  zone_id = var.zone_id
  type    = "CNAME"
  ttl     = var.ttl
  records = [module.elb.elb_address]
}

terraform {
  backend "s3" {
    bucket = "moodle-with-terraform-2020"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
