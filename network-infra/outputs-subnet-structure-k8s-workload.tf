output "k8s_workload_subnet_address_prefixes_map" {
  description = "k8s workload dedicated subnet prefixes, by environment"
  value = {
    "lab": local.k8s_workload_lab_subnet_address_prefixes
    "devstg": local.k8s_workload_devstg_subnet_address_prefixes
    "prod": local.k8s_workload_prod_subnet_address_prefixes
  }
}

output "k8s_lb_subnet_address_prefix_map" {
  description = "k8s lb dedicated subnet prefixes, by environment"
  value = {
    "lab": local.k8s_lb_lab_subnet_address_prefix
    "devstg": local.k8s_lb_devstg_subnet_address_prefix
    "prod": local.k8s_lb_prod_subnet_address_prefix
  }
}