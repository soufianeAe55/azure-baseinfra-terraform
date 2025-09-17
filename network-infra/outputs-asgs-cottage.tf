output "all_cottages_asg_id" {
  description = "all cottages workload asg id"
  value = module.all_cottages_asg.asg_id
}

output "all_cottages_asg_name" {
  description = "all cottages workload asg name"
  value = module.all_cottages_asg.asg_name
}


output "cottage_workload_asg_ids_map" {
  description = "cottage workload asg id by environment"
  value = {
    "lab" = { for item in keys(local.cottages_lab): item => module.lab_cottage_asgs[item].asg_id }
    "devstg" = { for item in keys(local.cottages_devstg): item => module.devstg_cottage_asgs[item].asg_id }
    "prod" = { for item in keys(local.cottages_prod): item => module.prod_cottage_asgs[item].asg_id }
  }
}

output "cottage_workload_asg_names_map" {
  description = "cottage workload asg name by environment"
  value = {
    "lab" = { for item in keys(local.cottages_lab): item => module.lab_cottage_asgs[item].asg_name }
    "devstg" = { for item in keys(local.cottages_devstg): item => module.devstg_cottage_asgs[item].asg_name }
    "prod" = { for item in keys(local.cottages_prod): item => module.prod_cottage_asgs[item].asg_name }
  }
}



