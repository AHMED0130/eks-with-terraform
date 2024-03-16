provider "aws" {
  region = "eu-north-1"
}

data "aws_availability_zones" "aval_zones" {
  state = "available"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.vpc-name
  cidr = var.vpc-ciderblock
  azs             = data.aws_availability_zones.aval_zones.zone_ids
  private_subnets = var.private_subnets-ciderblocks
  public_subnets  = var.public_subnets-ciderblocks

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
     "kubernetes.io/cluster/botique-app-cluster" = "shared"
  }

  public_subnet_tags = {
      "kubernetes.io/cluster/botique-app-cluster" = "shared"
      "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/botique-app-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}