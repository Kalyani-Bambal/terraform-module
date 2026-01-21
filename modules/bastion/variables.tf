variable "env" {
  type = string
}

# variable "vpc_id" {
#   type = string
# }

# variable "public_subnet_ids" {
#   type = list(string)
# }

# variable "ami" {
#   type = string
# }

# variable "instance_type" {
#   type = string
# }

# variable "key_name" {
#   type = string
# }

# variable "allowed_ssh_cidr" {
#   type = list(string)
# }

variable "tags" {
  type = map(string)
}

variable "bastion_assume_role_principals" {
  description = "IAM principals allowed to assume the bastion access role"
  type        = list(string)
}