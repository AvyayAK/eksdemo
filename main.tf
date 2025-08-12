provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}

locals {
  azs = data.aws_availability_zones.available.names
}

module "network" {
  source = "./network"
  name_prefix = var.name_prefix
 vpc_cidr             = var.vpc_cidr
 public_subnet_cidrs = var.public_subnet_cidrs
azs                = var.azs
}

module "security" {
  source = "./security"
  name_prefix = var.name_prefix
  vpc_id      = module.network.vpc_id
  cluster_cidr_blocks = var.cluster_cidr_blocks      # Example CIDR for control plane
  node_cidr_blocks    = var.node_cidr_blocks       # Example CIDR for worker nodes
  admin_ip            = var.admin_ip 
}

module "roles" {
  source              = "./roles"
  name_prefix         = var.name_prefix
  admin_principal_arn = var.admin_principal_arn
}


module "eks" {
  source               = "./eks"
  cluster_name         = var.cluster_name
  cluster_role_arn     = module.roles.cluster_role_arn
  node_role_arn        = module.roles.node_role_arn
  eks_admin_role_arn   = module.roles.eks_admin_role_arn
private_subnet_ids = module.network.public_subnet_ids
  name_prefix          = var.name_prefix
  ssh_key_name         = var.ssh_key_name
  bastion_sg_id        = module.security.bastion_sg_id
}
