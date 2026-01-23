resource "aws_iam_role_policy" "bastion_eks_access" {
  name = "${var.env}-bastion-eks-access"
  role = aws_iam_role.bastion_access_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:AccessKubernetesApi"
        ]
        Resource = "*"
      }
    ]
  })
}