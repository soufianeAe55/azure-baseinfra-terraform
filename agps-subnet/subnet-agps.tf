data "azurerm_virtual_network" "vnet" {
    name = var.vnet_name
    resource_group_name = var.vnet_rg_name
}

module "agps_subnet" {
  source                         = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-subnet//module?ref=2.0.2"
  custom_name                    = "${var.application}-agps-sn-${var.environment}"
  landing_zone_slug              = var.landing_zone_slug
  location_short                 = module.regions.location_short
  virtual_network_id             = data.azurerm_virtual_network.vnet.id
  stack                          = var.stack
  workload_info                  = "${var.application}-agps-${var.environment}"
  address_prefixes               = [var.agps_subnet_address_prefix]
  network_security_group_id      = module.agps_nsg.nsg_id

  service_endpoints = [
    "Microsoft.Storage"
  ]
  depends_on = [module.agps_nsg]
}