variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "name_prefix" {
  description = "Prefix for resource naming"
  type        = string
  default     = "eks-demo"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "ssh_key_name" {
  description = "SSH key name for EC2 access"
  type        = string
  default     = "eks-key"
}
variable "azs" {
  description = "Availability zones for subnet distribution"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}


variable "cluster_cidr_blocks" {
  description = "CIDR blocks for EKS control plane"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "node_cidr_blocks" {
  description = "CIDR blocks for EKS worker nodes"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "admin_ip" {
   type = string
default = "203.0.113.5/32" 
}

variable "admin_principal_arn" {
  description = "IAM principal ARN to be mapped as EKS admin"
  type        = string
  default     = "arn:aws:iam::yourawsid:root"
}
