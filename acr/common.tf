module "regions" {
  source       = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-regions//module?ref=master"
  azure_region = var.location
}

module "base_tagging" {
  source          = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-basetagging//module?ref=master"
  environment     = var.environment
  application     = var.application
  cost_center     = var.cost_center
  change          = var.change
  owner           = var.owner
  spoc            = var.spoc
  tlp_colour      = var.tlp_colour
  cia_rating      = var.cia_rating
  technical_owner = var.technical_owner
  ado_repo        = var.ado_repo
}