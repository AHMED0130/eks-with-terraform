module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.3"
  cluster_name    = "botique-app-cluster"
  cluster_version = "1.18"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  
}
