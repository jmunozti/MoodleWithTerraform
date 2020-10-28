
region              = "us-east-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.0.0/24"
private_subnet_cidr = "10.0.1.0/24"
ssh_key             = "moodle"
instance_type       = "t2.micro"
ami_id              = "ami-00ddb0e5626798373"
ec2_count           = "1"
environment         = "dev"
elb_is_internal     = false
