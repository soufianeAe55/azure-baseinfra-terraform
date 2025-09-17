module "front_ip_rbac" {
  source = "git::ssh://git@ssh.dev.azure.com/v3/ORG-NAME/escape-mod/terraform-steerin-baseinfra-modules//rbac?ref=main"

  role_assignments = local.role_assignments_per_env[var.environment]

  depends_on = [module.public_ip_resource_group]
}