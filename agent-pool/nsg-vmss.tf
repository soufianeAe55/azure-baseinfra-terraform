module "vmss_nsg" {
  count                           = var.vmss_subnet_creation_enabled ? 1 : 0
  source                          = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-nsg//module?ref=2.0.0"
  custom_name                     = "${var.application}-vmss-nsg-${var.environment}"
  landing_zone_slug               = var.landing_zone_slug
  stack                           = var.stack
  location                        = module.regions.location
  location_short                  = module.regions.location_short
  resource_group_name             = var.vnet_rg_name
  workload_info                   = "${var.application}-vmss-${var.environment}"
  security_rules = {} # empty for now, added in another microseg-rules tf file
  default_tags                    = module.base_tagging.base_tags
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id
}