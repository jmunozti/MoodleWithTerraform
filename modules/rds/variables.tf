variable "zone_id" {
  description = "A Hosted Zone Id."
}

variable "rds_subnets_ids" {
  description = "A list of subnets for the RDS."
}

variable "ttl" {
  description = "DNS TTL Is a setting that tells the DNS resolver how long to cache a query before requesting a new one"
}

variable "rds_vpc_security_group_ids" {
  description = "List of VPC ids"
}
