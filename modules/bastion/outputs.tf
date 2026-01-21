# output "bastion_public_ip" {
#   value = aws_instance.bastion.public_ip
# }

# output "role_arn" {
#   description = "IAM role ARN for bastion host"
#   value       = aws_iam_role.this.arn
# }

output "bastion_access_role_arn" {
  description = "IAM role ARN used for bastion access to EKS"
  value       = aws_iam_role.bastion_access_role.arn
}

output "bastion_access_role_name" {
  description = "IAM role name used for bastion access to EKS"
  value       = aws_iam_role.bastion_access_role.name
}