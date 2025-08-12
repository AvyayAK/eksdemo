output "vpc_id" {
  value = module.network.vpc_id
}


output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_admin_configmap" {
  value = module.eks.aws_auth_configmap_name
}

output "private_subnet_ids" {
  value = module.network.public_subnet_ids
}