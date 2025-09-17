output "k8s_workload_nsg_id" {
  description = "k8s_workload nsg id"
  value = module.k8s_workload_nsg.nsg_id
}

output "k8s_workload_nsg_name" {
  description = "k8s_workload nsg name"
  value = module.k8s_workload_nsg.nsg_name
}