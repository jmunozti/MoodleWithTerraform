resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.rds_subnets_ids

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  db_subnet_group_name   = aws_db_subnet_group.default.name
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "moodle"
  username               = "foo"
  password               = "f00barbaz1"
  parameter_group_name   = "default.mysql5.7"
  max_allocated_storage  = 100
  skip_final_snapshot    = true
  vpc_security_group_ids = var.rds_vpc_security_group_ids
}

resource "aws_route53_record" "mysql_endpoint" {
  name    = "mysql.moodlewithterraform.ml"
  zone_id = var.zone_id
  type    = "CNAME"
  ttl     = var.ttl
  records = [element(split(":", aws_db_instance.default.endpoint), 0)]
}
