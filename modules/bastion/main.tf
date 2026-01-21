# resource "aws_security_group" "this" {
#   name   = "${var.env}-bastion-sg"
#   vpc_id = var.vpc_id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = var.allowed_ssh_cidr
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = merge(
#     { Name = "${var.env}-bastion-sg" },
#     var.tags
#   )
# }

# resource "aws_iam_role" "this" {
#   name = "${var.env}-bastion-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{
#       Effect    = "Allow"
#       Principal = { Service = "ec2.amazonaws.com" }
#       Action    = "sts:AssumeRole"
#     }]
#   })
# }

# resource "aws_iam_role_policy_attachment" "eks_access" {
#   role       = aws_iam_role.this.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }

# resource "aws_iam_instance_profile" "this" {
#   role = aws_iam_role.this.name
# }

# resource "aws_instance" "bastion" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   subnet_id     = element(var.public_subnet_ids, 0)
#   key_name      = var.key_name
#   security_groups = [aws_security_group.this.id]
#   iam_instance_profile = aws_iam_instance_profile.this.name

#   associate_public_ip_address = true
#   user_data = file("${path.module}/user_data.sh")

#   tags = merge(
#     { Name = "${var.env}-bastion" },
#     var.tags
#   )
# }

resource "aws_iam_role" "bastion_access_role" {
  name = "${var.env}-bastion-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = var.bastion_assume_role_principals
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}
