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

resource "aws_iam_role" "node_role" {
 name = "${var.env}-eks-node-role"
 assume_role_policy = jsondecode({
    version = "2012-10-17"
    statement = [
      {
        effect = "Allow"
        principal = {
          service = "ec2.amazonaws.com"
        }
        action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  role       = aws_iam_role.node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "cni_policy" {
  role       = aws_iam_role.node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_policy" {
  role       = aws_iam_role.node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}