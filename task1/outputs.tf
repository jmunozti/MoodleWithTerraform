output "vpc_id" {
  value = module.vpc.vpc_id
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "bastion_public_dns" {
  value = module.bastion.public_dns
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "elb_public_dns" {
  value = module.elb.elb_address
}
