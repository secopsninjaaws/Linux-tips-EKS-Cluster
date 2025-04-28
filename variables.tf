variable "project_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "auto_scaling" {
  type = object({
    desired = number
    max     = number
    min     = number
  })
}

variable "node_instance_sizes" {
  type = list(string)
}
variable "region" {
  type = string
}