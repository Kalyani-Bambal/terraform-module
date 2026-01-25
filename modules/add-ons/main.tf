resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = var.cluster_name
  addon_name    = "vpc-cni"
  addon_version = var.cni_version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  cluster_name  = var.cluster_name
  addon_name    = "coredns"
  addon_version = var.coredns_version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name  = var.cluster_name
  addon_name    = "kube-proxy"
  addon_version = var.kube_proxy_version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name  = var.cluster_name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = var.ebs_csi_driver_version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
}

resource "aws_eks_addon" "efs_csi_driver" {
  cluster_name  = var.cluster_name
  addon_name    = "aws-efs-csi-driver"
  # No version specified, uses latest available

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  
}