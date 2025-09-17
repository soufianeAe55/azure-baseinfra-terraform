variable "k8s_workload_subnet_address_prefixes_map" {
  description = "k8s_workload subnet address prefixes by environment"
  type = object({
    lab = list(string)
    devstg = list(string)
    prod = list(string)
  })
}

variable "k8s_lb_subnet_address_prefix_map" {
  description = "k8s_lb subnet address prefix by environment"
  type = object({
    lab = string
    devstg = string
    prod = string
  })
}