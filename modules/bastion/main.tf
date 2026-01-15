resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.bastion_subnet_id
  key_name                    = var.bastion_key_name
  vpc_security_group_ids      = var.bastion_security_group_ids
  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-bastion"
    }
  )
  
}

resource "aws_security_group" "bastion_sg" {
  name        = "${var.environment}-bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = var.bastion_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allow_ssh_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}