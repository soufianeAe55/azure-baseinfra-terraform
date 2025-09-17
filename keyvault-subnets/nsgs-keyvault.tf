module "keyvault_nsg" {
  for_each = var.keyvault_subnet_address_prefix_map

  source                          = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-nsg//module?ref=2.0.0"
  custom_name                     = "${var.application}-kv-${each.key}-nsg"
  landing_zone_slug               = var.landing_zone_slug
  stack                           = var.stack
  location                        = module.regions.location
  location_short                  = module.regions.location_short
  resource_group_name             = var.network_microseg_resource_group_name
  workload_info                   = "${var.application}-kv-${each.key}"
  security_rules                  = {} # empty for now, added in another microseg-rules tf file
  default_tags                    = module.base_tagging.base_tags
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id
}