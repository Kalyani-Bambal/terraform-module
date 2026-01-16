resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.public_subnet_ids[0]
  key_name                    = var.bastion_key_name
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id
  ]
  user_data = file("${path.module}/user_data.sh")

  tags = merge(
    var.common_tags,
    {
      Name = "${var.env}-bastion"
    }
  )
  }
  
