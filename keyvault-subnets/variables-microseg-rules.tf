variable "agp_asg_ids_map" {
  description = "agp asg ids by environment"
  type = object({
    baseinfra = string
    lab = string
    devstg = string
    prod = string
  })
}

variable "gateway_subnet_address_prefix" {
  description = "Gateway subnet address prefix."
  type = string
}

variable "k8s_workload_subnet_address_prefixes_map" {
  description = "k8s_workload subnet address prefixes by environment"
  type = object({
    lab = list(string)
    devstg = list(string)
    prod = list(string)
  })
}
