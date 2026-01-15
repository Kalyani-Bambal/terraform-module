variable "bastion_ami" {
  type = string
}

variable "bastion_instance_type" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "bastion_key_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "env" {
  type = string
}

variable "allowed_ssh_cidrs" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
