  module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version= "~> 4.0"
    name = local.name
    cidr = local.vpc_cidr
    azs = local.azs
    public_subnets = local.public_subnet_cidrs
    private_subnets = local.private_subnet_cidrs
    intra_subnets = local.intranet_subnet_cidrs 
    enable_nat_gateway = true   

    public_subnet_tags = {
     kubernetes.io/role/elb = "1"
    }

    private_subnet_tags = {
        kubernetes.io/role/internal-elb = "1"
    }
    
  }

