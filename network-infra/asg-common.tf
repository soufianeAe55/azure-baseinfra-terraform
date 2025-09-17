locals {
  common_asgs = {
    "gateway" = {
      "name" = "gateway"
      "workload_info" = "gateway"
    },
    "jumpvm" = {
      "name" = "jumpvm"
      "workload_info" = "jumpvm"
    },
    "cicd" = {
      "name" = "cicd"
      "workload_info" = "cicd"
    },
    "kv-baseinfra" = {
      "name" = "kv"
      "workload_info" = "kv-baseinfra"
    },
    "agp-baseinfra" = {
      "name" = "agp"
      "workload_info" = "agp-baseinfra"
    }
    // we do not create for basrtion, as J2C module creates its own for bastion
  }
}

module "common_asgs" {
  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  for_each            = local.common_asgs
  custom_name         = "${var.application}-${each.value["name"]}-asg-${var.environment}"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = each.value["workload_info"]
  default_tags        = module.base_tagging.base_tags
  depends_on = [ module.network_microseg_resource_group ]
}

