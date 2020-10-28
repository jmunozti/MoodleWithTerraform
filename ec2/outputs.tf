output "private_ip" {
  value = aws_instance.my_ec2[0].private_ip
}
