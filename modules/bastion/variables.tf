variable "bastion_ami" {
  type = string
}

variable "bastion_instance_type" {
  type = string
}

variable "bastion_subnet_id" {
  type = string
}

variable "bastion_key_name" {
  type = string
}

variable "bastion_security_group_ids" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

variable "environment" {
  type = string
}

variable "allow_ssh_cidrs" {
  type = list(string)
}

variable "bastion_vpc_id" {
  type = string
}