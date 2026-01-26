variable "namespace" {
  type = string
  default = "argocd"
}

variable "chart_version" {
  type = string
  default = "5.51.6"
}

variable "values" {
  type = list(string)
    default = []
}

variable "cluster_name" {
  type = string
}

variable "bootstrap_file" {
  type = string
}