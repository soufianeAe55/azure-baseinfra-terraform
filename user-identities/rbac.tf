module "bastion_rbac" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/escape-mod/terraform-steerin-baseinfra-modules//rbac?ref=main"

  role_assignments = local.role_assignments_per_env[var.environment]

  depends_on = [
    module.user_assigned_identities_resource_group,
    azurerm_user_assigned_identity.user_assigned_identities
  ]
}