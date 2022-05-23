data "aws_eks_cluster" "eks_prod_002" {
  name = var.eks_name
}

data "aws_eks_cluster_auth" "eks_prod_002_auth" {
  name = var.eks_name
}
