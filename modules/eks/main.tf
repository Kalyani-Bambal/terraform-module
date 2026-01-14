resource "aws_iam_role" "eks_cluster_role" {
  name               = "${var.env}-eks-cluster-role"
  assume_role_policy = jsondecode({
    version = "2012-10-17"
    statement = [
      {
        effect = "Allow"
        principal = {
          service = "eks.amazonaws.com"
        }
        action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_policy_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "this" {
  name = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = var.cluster_version

  vpc_config {
    subnet_ids = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access = false
  }

  tags = merge (
    var.tags,
    {
        Name = var.cluster_name
    }
  )
}