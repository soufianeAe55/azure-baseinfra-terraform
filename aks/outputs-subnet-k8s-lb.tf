output "k8s_lb_subnet_id" {
  description = "k8s_loadbalancer subnet id"
  value = module.k8s_lb_subnet.subnet_id
}

output "k8s_lb_subnet_name" {
  description = "k8s_loadbalancer subnet name"
  value = module.k8s_lb_subnet.subnet_name
}