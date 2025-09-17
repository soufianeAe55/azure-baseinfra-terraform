module "all_cottages_asg" {

  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  custom_name         = "all-cottages-asg"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = "all-cottage"
  default_tags        = module.base_tagging.base_tags
  depends_on = [ 
    module.network_microseg_resource_group 
  ]

}





module "prod_cottage_asgs" {

  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  for_each            = toset(keys(local.cottages_prod))
  custom_name         = "${each.value}-${local.cottages_prod[each.key]["type"]}-cottage-asg-prod"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = "${each.value}-cottage-prod"
  default_tags        = module.base_tagging_prod.base_tags
  extra_tags          = {
    "cottage_name" = each.key
    "cottage_type" = local.cottages_prod[each.key]["type"]
  }
  depends_on = [ 
    module.network_microseg_resource_group 
  ]

}

module "devstg_cottage_asgs" {

  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  for_each            = toset(keys(local.cottages_devstg))
  custom_name         = "${each.key}-${local.cottages_devstg[each.key]["type"]}-cottage-asg-devstg"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = "${each.value}-cottage-devstg"
  default_tags        = module.base_tagging_devstg.base_tags
  extra_tags          = {
    "cottage_name" = each.key
    "cottage_type" = local.cottages_devstg[each.key]["type"]
  }
  depends_on = [ 
    module.network_microseg_resource_group 
  ]

}

module "lab_cottage_asgs" {

  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  for_each            = toset(keys(local.cottages_lab))
  custom_name         = "${each.key}-${local.cottages_lab[each.key]["type"]}-cottage-asg-lab"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = "${each.value}-cottage-lab"
  default_tags        = module.base_tagging_lab.base_tags
  extra_tags          = {
    "cottage_name" = each.key
    "cottage_type" = local.cottages_lab[each.key]["type"]
  }
  depends_on = [ 
    module.network_microseg_resource_group 
  ]

}

