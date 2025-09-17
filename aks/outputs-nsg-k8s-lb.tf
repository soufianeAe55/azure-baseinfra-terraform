output "k8s_lb_nsg_id" {
  description = "k8s_loadbalancer nsg id"
  value = module.k8s_lb_nsg.nsg_id
}

output "k8s_lb_nsg_name" {
  description = "k8s_loadbalancer nsg name"
  value = module.k8s_lb_nsg.nsg_name
}