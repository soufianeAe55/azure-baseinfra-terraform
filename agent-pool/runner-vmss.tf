resource "null_resource" "vmss_subnet_dependency" {
  count = var.vmss_subnet_creation_enabled ? 1 : 0
  depends_on = [module.vmss_subnet]
}

module "runner_vmss" {

  source           = "../runner-vmss"
  runner_vmss_name = "${var.agent-pool_name}-vmss"
  vmss_subnet_id   = var.vmss_subnet_creation_enabled ? module.vmss_subnet[0].subnet_id : var.vmss_subnet_id
  vmss_asg_id = var.vmss_asg_id
  source_image_id = var.vmss_source_image_id

  // BEGINNING OF GENERIC SECTION -------------------
  environment       = var.environment
  application       = var.application
  location          = var.location
  owner             = var.owner
  stack             = var.stack
  project_name      = var.project_name
  spoc              = var.spoc
  cost_center       = var.cost_center
  change            = var.change
  tlp_colour        = var.tlp_colour
  cia_rating        = var.cia_rating
  technical_owner   = var.technical_owner
  landing_zone_slug = var.landing_zone_slug
  sku               = var.sku
  ado_repo = var.ado_repo
  // END OF GENERIC SECTION -------------------

  depends_on = [null_resource.vmss_subnet_dependency]

}