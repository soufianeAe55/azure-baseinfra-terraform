output "k8s_workload_subnet_ids" {
  description = "k8s_workload subnet ids"
  value = module.k8s_workload_subnets[*].subnet_id
}

output "k8s_workload_subnet_names" {
  description = "k8s_workload subnet names"
  value = module.k8s_workload_subnets[*].subnet_name
}