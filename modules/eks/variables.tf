variable "env" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS will be deployed"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for worker nodes"
}

variable "tags" {
  type = map(string)
}

variable "desired_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "node_instance_types" {
  type = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access EKS private endpoint"
  type = list(string)
  default = [  ]
}

# variable "bastion_role_arn" {
#   type = string
# }

variable "bastion_access_role_arn" {
  description = "IAM role ARN used for bastion access to EKS"
  type        = string
}

