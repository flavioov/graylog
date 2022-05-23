terraform {
  required_version = "1.1.9"
  backend "s3" {
    bucket  = "gitlab-stefanini-terraform-backend"
    key     = "msp/cloud/aws/msp.cel430.saas/iac/terraform/eks-devops-prod-002/graylog/graylog.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }

    spotinst = {
      source  = "spotinst/spotinst"
      version = "1.73.3"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }
  }
}

# As Env variable
provider "aws" {}

# As Env variable
provider "spotinst" {}


provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_prod_002.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_prod_002.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_prod_002_auth.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_prod_002.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_prod_002.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks_prod_002_auth.token
  }
}
