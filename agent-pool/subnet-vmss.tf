resource "null_resource" "vmss_nsg_dependency" {
  count = var.vmss_subnet_creation_enabled ? 1 : 0
  depends_on = [module.vmss_nsg]
}

module "vmss_subnet" {
  count                          = var.vmss_subnet_creation_enabled ? 1 : 0
  source                         = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-subnet//module?ref=1.4.0"
  custom_name                    = var.vmss_subnet_name
  landing_zone_slug              = var.landing_zone_slug
  location_short                 = module.regions.location_short
  resource_group_name            = var.vnet_rg_name
  virtual_network_name           = var.vnet_name
  stack                          = var.stack
  workload_info                  = "${var.application}-vmss-sn-${var.environment}"
  address_prefixes = [var.vmss_subnet_address_prefix]
  network_security_group_enabled = true
  network_security_group_id      = module.vmss_nsg[0].nsg_id

  depends_on = [null_resource.vmss_nsg_dependency]
}