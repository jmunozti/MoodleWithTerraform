resource "aws_instance" "my_ec2" {
  count                  = var.ec2_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  availability_zone      = var.availability_zone_1
  key_name               = var.ssh_key
  vpc_security_group_ids = [aws_security_group.ec2.id]

  user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
EOF

  tags = {
    Name = format("%s_ec2", var.environment)
  }
}
