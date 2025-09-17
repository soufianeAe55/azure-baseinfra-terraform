output "agp_asg_ids_map" {
  description = "agp asg id by environment"
  value = {
    "baseinfra" = module.common_asgs["agp-baseinfra"].asg_id
    "lab"       = module.workload_asgs["agp-lab"].asg_id
    "devstg"    = module.workload_asgs["agp-devstg"].asg_id
    "prod"      = module.workload_asgs["agp-prod"].asg_id
  }
}

output "agp_asg_names_map" {
  description = "agp asg name by environment"
  value = {
    "baseinfra" = module.common_asgs["agp-baseinfra"].asg_name
    "lab"       = module.workload_asgs["agp-lab"].asg_name
    "devstg"    = module.workload_asgs["agp-devstg"].asg_name
    "prod"      = module.workload_asgs["agp-prod"].asg_name
  }
}