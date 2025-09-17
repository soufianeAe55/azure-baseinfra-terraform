module "acr_rg" {
  source            = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-resourcegroup//module?ref=master"
  stack             = var.stack
  custom_name       = local.acr_rg_name
  landing_zone_slug = var.landing_zone_slug
  default_tags      = module.base_tagging.base_tags
  location          = module.regions.location
  location_short    = module.regions.location_short
}