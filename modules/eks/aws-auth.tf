################################
# Kubernetes Provider (EKS)
################################
provider "kubernetes" {
  host                   = aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(
    aws_eks_cluster.this.certificate_authority[0].data
  )

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      aws_eks_cluster.this.name
    ]
  }
}

################################
# aws-auth ConfigMap
################################
resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapUsers = <<YAML
- userarn: arn:aws:iam::358871393576:user/Kalyani-Bambal
  username: Kalyani-Bambal
  groups:
    - system:masters
YAML

    mapRoles = <<YAML
- rolearn: arn:aws:iam::358871393576:role/github-actions-terraform-role-1
  username: github-actions
  groups:
    - system:masters
YAML
  }
}
