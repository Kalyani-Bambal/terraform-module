variable "cluster_name" {
  type = string
}

variable "addons" {
  description = "Map of EKS addons to enable"
  type = map(object({
    version = optional(string)
  }))
}
