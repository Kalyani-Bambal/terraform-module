resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = var.bastion_key_name
  vpc_security_group_ids = [
    aws_security_group.bastion_sg.id
  ]
  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.env}-bastion"
    }
  )  
}


