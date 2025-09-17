module "analytics_rbac" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/escape-mod/terraform-steerin-baseinfra-modules//rbac?ref=main"

  role_assignments = local.role_assignments_per_env_per_component[var.environment][var.component != "" ? var.component : "shared"]

  depends_on = [module.monitoring_resource_group]
}