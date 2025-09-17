resource "azurerm_user_assigned_identity" "user_assigned_identities" {
  for_each = local.user_assigned_identities

  location            = module.regions.location
  name                = "${var.application}-${each.value.component}-uid-${each.value.environment}"
  resource_group_name = module.user_assigned_identities_resource_group.resource_group_name
  tags                = module.base_tagging.base_tags
}