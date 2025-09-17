output "kv_asg_ids_map" {
  description = "kv asg id by environment"
  value = {
    "baseinfra" = module.common_asgs["kv-baseinfra"].asg_id
    "lab" = module.workload_asgs["kv-lab"].asg_id
    "devstg" = module.workload_asgs["kv-devstg"].asg_id
    "prod" = module.workload_asgs["kv-prod"].asg_id
  }
}

output "kv_asg_names_map" {
  description = "kv asg name by environment"
  value = {
    "baseinfra" = module.common_asgs["kv-baseinfra"].asg_name
    "lab" = module.workload_asgs["kv-lab"].asg_name
    "devstg" = module.workload_asgs["kv-devstg"].asg_name
    "prod" = module.workload_asgs["kv-prod"].asg_name
  }
}