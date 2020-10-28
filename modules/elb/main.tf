resource "aws_elb" "elb" {
  name                        = "Elastic-load-balancer"
  subnets                     = [var.subnet_id]
  security_groups             = [aws_security_group.elb.id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = 400
  connection_draining         = var.connection_draining
  connection_draining_timeout = 400
  internal                    = var.internal


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:005488327456:certificate/b07335b5-641d-431f-a2fe-b638aadeb9ba"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 5
  }


  tags = {
    Name = format("%s_elb", var.environment)
  }
}
