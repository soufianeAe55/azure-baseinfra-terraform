module "role_assignments" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/ECTL-Terraform-Modules/terraform-azurerm-roleassignment//module?ref=1.0.0"

  for_each = {
    for role_assignment in var.role_assignments :
    "${lower(substr(role_assignment.principal_id, 0, 8))}_${lower(replace(
      length(role_assignment.role) > 0 ? role_assignment.role :
      length(role_assignment.role_definition_id) > 0 ? substr(split("/", role_assignment.role_definition_id)[length(split("/", role_assignment.role_definition_id)) - 1], 0, 8) : "",
      " ", "-"
    ))}" => role_assignment
  }

  scope                = each.value.scope
  role_definition_name = length(each.value.role) > 0 ? each.value.role : null
  role_definition_id   = length(each.value.role_definition_id) > 0 ? each.value.role_definition_id : null
  principal_id         = each.value.principal_id
  principal_type       = each.value.principal_type
}