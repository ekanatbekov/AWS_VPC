
vpc_name = "project_dev_vpc"
vpc_cidr = "10.0.0.0/16"
available_zones = ["us-west-1a", "us-west-1b", "us-west-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = true
tags = {
    env = "dev"
    provisioned = "terraform"
}