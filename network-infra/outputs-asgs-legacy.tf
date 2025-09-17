output "legacy_workload_asg_ids_map" {
  description = "legacy workload asg id by environment"
  value = {
    "lab" = module.workload_asgs["legacy-lab"].asg_id
    "devstg" = module.workload_asgs["legacy-devstg"].asg_id
    "prod" = module.workload_asgs["legacy-prod"].asg_id
  }
}

output "legacy_workload_asg_names_map" {
  description = "legacy workload asg name by environment"
  value = {
    "lab" = module.workload_asgs["legacy-lab"].asg_name
    "devstg" = module.workload_asgs["legacy-devstg"].asg_name
    "prod" = module.workload_asgs["legacy-prod"].asg_name
  }
}



