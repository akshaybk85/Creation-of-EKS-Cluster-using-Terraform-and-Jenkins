  module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version= "~> 4.0"
    name = locals.name
    cidr = locals.vpc_cidr
    azs = locals.azs
    public_subnets = locals.public_subnet_cidrs
    private_subnets = locals.private_subnet_cidrs
    intra_subnets = locals.intranet_subnet_cidrs 
    enable_nat_gateway = true   

    public_subnet_tags = {
     kubernetes.io/role/elb = "1"
    }

    private_subnet_tags = {
        kubernetes.io/role/internal-elb = "1"
    }
    
  }

