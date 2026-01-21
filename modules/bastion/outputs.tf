output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "role_arn" {
  description = "IAM role ARN for bastion host"
  value       = aws_iam_role.this.arn
}