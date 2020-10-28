output "elb_address" {
  description = "Shows the Elastic Load Balancer public dns"
  value       = aws_elb.elb.dns_name
}
output "elb_name" {
  description = "Shows the Elastic Load Balancer name"
  value       = aws_elb.elb.name
}
