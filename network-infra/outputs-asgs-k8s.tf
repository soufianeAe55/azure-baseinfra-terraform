output "k8s_workload_asg_ids_map" {
  description = "k8s workload asg id by environment"
  value = {
    "lab" = module.workload_asgs["k8s-lab"].asg_id
    "devstg" = module.workload_asgs["k8s-devstg"].asg_id
    "prod" = module.workload_asgs["k8s-prod"].asg_id
  }
}

output "k8s_workload_asg_names_map" {
  description = "k8s workload asg name by environment"
  value = {
    "lab" = module.workload_asgs["k8s-lab"].asg_name
    "devstg" = module.workload_asgs["k8s-devstg"].asg_name
    "prod" = module.workload_asgs["k8s-prod"].asg_name
  }
}