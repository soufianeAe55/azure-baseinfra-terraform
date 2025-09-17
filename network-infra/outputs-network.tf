output "virtual_network_id" {
  description = "vnet id"
  value       = module.vnet.virtual_network_id
}

output "virtual_network_name" {
  description = "vnet name"
  value       = module.vnet.virtual_network_name
}

output "vnet_classA_address_network_portion" {
  description = "class A network prefix to be used for the whole vnet"
  value       = var.vnet_classA_address_network_portion
}

output "virtual_network_resource_group_name" {
  description = "virtual network resource group name. this rg will contain the vnet ()"
  value       = module.network_infra_resource_group.resource_group_name
}

output "network_microseg_resource_group_name" {
  description = "network microseg resource group name. this rg will contain all the vnet related microseg rules"
  value       = module.network_microseg_resource_group.resource_group_name
}