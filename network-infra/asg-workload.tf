locals {
  workload_asgs = {
    "k8s-prod" = {
      "name"        = "k8s_workload"
      "environment" = "prod"
    },
    "kv-prod" = {
      "name"        = "kv"
      "environment" = "prod"
    },
    "agp-prod" = {
      "name"        = "agp"
      "environment" = "prod"
    },
    "legacy-prod" = {
      "name"        = "legacy"
      "environment" = "prod"
    },
    "k8s-devstg" = {
      "name"        = "k8s_workload"
      "environment" = "devstg"
    },
    "kv-devstg" = {
      "name"        = "kv"
      "environment" = "devstg"
    },
    "agp-devstg" = {
      "name"        = "agp"
      "environment" = "devstg"
    },
    "legacy-devstg" = {
      "name"        = "legacy"
      "environment" = "devstg"
    },
    "k8s-lab" = {
      "name"        = "k8s_workload"
      "environment" = "lab"
    },
    "kv-lab" = {
      "name"        = "kv"
      "environment" = "lab"
    },
    "agp-lab" = {
      "name"        = "agp"
      "environment" = "lab"
    },
    "legacy-lab" = {
      "name"        = "legacy"
      "environment" = "lab"
    }
  }
}


module "workload_asgs" {
  source              = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-asg//module?ref=1.0.3"
  for_each            = local.workload_asgs
  custom_name         = "${var.application}-${each.value["name"]}-${each.value["environment"]}-asg-${var.environment}"
  resource_group_name = local.network_microseg_rg_name
  location            = module.regions.location
  location_short      = module.regions.location_short
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  workload_info       = "${each.value["name"]}-${each.value["environment"]}"
  default_tags        = module.base_tagging.base_tags
  depends_on          = [module.network_microseg_resource_group]
}



