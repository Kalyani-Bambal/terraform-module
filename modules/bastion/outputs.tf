output "public_ip_address" {
  description = "Public IP address"
  value = aws_instance.bastion.public_ip
}

# output "bastion_security_group_ids" {
#   value = aws_security_group.bastion_sg.id
# }