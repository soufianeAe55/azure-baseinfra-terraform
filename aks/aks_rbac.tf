module "aks_rbac" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/escape-mod/terraform-steerin-baseinfra-modules//rbac?ref=main"

  role_assignments = local.aks_role_assignments_per_env[var.environment]

  depends_on = [module.aks_rg]
}