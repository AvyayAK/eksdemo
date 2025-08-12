# 📈 Flask Stock API on EKS with Route 53 & NLB

This project deploys a containerized Flask API that serves stock data (e.g., AAPL, IBM) on AWS EKS. It uses Terraform for infrastructure provisioning, Kubernetes for orchestration, and Route 53 for custom domain mapping.

---

## 🚀 Architecture Overview

- **Flask API** containerized with Docker
- **EKS Cluster** provisioned via Terraform
- **Kubernetes Service** of type `LoadBalancer` with NLB annotation
- **AWS NLB** automatically provisioned by EKS
- **Route 53** alias record pointing to NLB DNS
- **Custom Domain**: `ekstest.com.swathi-apps.cloud`

