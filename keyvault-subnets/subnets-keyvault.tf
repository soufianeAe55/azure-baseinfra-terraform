module "keyvault_subnet" {
  for_each = var.keyvault_subnet_address_prefix_map

  source                         = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-subnet//module?ref=1.4.0"
  custom_name                    = "${var.application}-kv-sn-${each.key}"
  landing_zone_slug              = var.landing_zone_slug
  location_short                 = module.regions.location_short
  resource_group_name            = var.vnet_rg_name
  virtual_network_name           = var.vnet_name
  stack                          = var.stack
  workload_info                  = "${var.application}-kv-${each.key}"
  address_prefixes               = [each.value]
  network_security_group_enabled = true
  network_security_group_id      = module.keyvault_nsg[each.key].nsg_id

  depends_on = [module.keyvault_nsg]
}