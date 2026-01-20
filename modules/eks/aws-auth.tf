resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapUsers = <<YAML
- userarn: arn:aws:iam::358871393576:user/Kalyani-Bambal
  username: kalyani-bambal
  groups:
    - system:masters
YAML
  }
}
