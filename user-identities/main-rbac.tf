locals {
  // Newly created groups will be used instead
  infrastructure_group_principal_id = "26920d55-9136-4186-b007-fbf7e00645f6" # SG-DEV-ESCAPE-MOD-READERS

  // For teams, the role-scope granularity is set to the Resource Group level 
  rg_role_scope = module.user_assigned_identities_resource_group.resource_group_id

  // principal types
  group_principal_type   = "Group"
  service_principal_type = "ServicePrincipal"

  // Built-in roles
  reader_built_in_role                    = "Reader"
  managed_identity_operator_built_in_role = "Managed Identity Operator"

  role_assignments_per_env = {
    baseinfra = [
      {
        principal_id   = local.infrastructure_group_principal_id,
        role           = local.reader_built_in_role,
        scope          = local.rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = azurerm_user_assigned_identity.user_assigned_identities["aks-lab"].principal_id,
        role           = local.managed_identity_operator_built_in_role,
        scope          = local.rg_role_scope
        principal_type = local.service_principal_type
      },
      {
        principal_id   = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg"].principal_id,
        role           = local.managed_identity_operator_built_in_role,
        scope          = local.rg_role_scope
        principal_type = local.service_principal_type
      }
    ],
    lab    = [],
    devstg = [],
    prod   = []
  }
}