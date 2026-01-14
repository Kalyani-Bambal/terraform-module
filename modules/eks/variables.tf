variable "env" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "private_subnet" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}