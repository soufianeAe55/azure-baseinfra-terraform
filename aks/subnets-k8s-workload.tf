module "k8s_workload_subnets" {
  source                         = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-subnet//module?ref=1.4.0"
  count                          = length(var.k8s_workload_subnet_address_prefixes_map["${var.environment}"])
  custom_name                    = "${var.application}-k8s_workload-sn-${count.index}-${var.environment}"
  landing_zone_slug              = var.landing_zone_slug
  location_short                 = module.regions.location_short
  resource_group_name            = var.vnet_rg_name
  virtual_network_name           = var.vnet_name
  stack                          = var.stack
  workload_info                  = "${var.application}-k8s-workload-${var.environment}"
  address_prefixes               = [var.k8s_workload_subnet_address_prefixes_map["${var.environment}"][count.index]]
  network_security_group_enabled = true
  network_security_group_id      = module.k8s_workload_nsg.nsg_id

  service_endpoints = [
    "Microsoft.Storage"
  ]
  
  depends_on = [ module.k8s_workload_nsg ]
}