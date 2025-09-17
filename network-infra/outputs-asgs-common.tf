output "gateway_asg_id" {
  description = "gateway asg id"
  value       = module.common_asgs["gateway"].asg_id
}

output "jump_vm_asg_id" {
  description = "jump vm asg id"
  value       = module.common_asgs["jumpvm"].asg_id
}

output "cicd_asg_id" {
  description = "cicd asg id"
  value       = module.common_asgs["cicd"].asg_id
}