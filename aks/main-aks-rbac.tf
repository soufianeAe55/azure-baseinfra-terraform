locals {
  // Newly created groups will be used instead
  infrastructure_group_principal_id = "26920d55-9136-4186-b007-fbf7e00645f6" # SG-DEV-ESCAPE-MOD-READERS
  hmi_group_principal_id= "f9f77e85-e8a5-449f-9a99-0f82d82dde78" # SG-AZURE-ESCAPE-MOD-HMI
  middleware_group_principal_id= "907c345f-5ad8-413d-9b08-daeb93a50877" # SG-AZURE-ESCAPE-MOD-MIDDLEWARE
  atg_group_principal_id= "3cfa904b-9b95-480a-8658-ec112051d2c4" # SG-AZURE-ESCAPE-MOD-ATG
  coretech_group_principal_id= "bb00c230-1d46-4747-98eb-f89973530afb" #SG-AZURE-ESCAPE-MOD-CORETECH
  //applications
  escape_mod_app_principal_id = "36346fb3-19ac-42c4-9b8e-323c36719143" # sp-escapeblddev-escape-mod-app(pipeline)
  // For teams, the role-scope granularity is set to the Resource Group level 
  aks_rg_role_scope = module.aks_rg.resource_group_id

  // principal types
  group_principal_type   = "Group"
  service_principal_type = "ServicePrincipal"

  // Built-in roles
  reader_built_in_role              = "Reader"
  aks_rg_cluster_user_built_in_role = "Azure Kubernetes Service Cluster User Role"
  aks_rg_cluster_admin_built_in_role = "Azure Kubernetes Service RBAC Cluster Admin"

  aks_role_assignments_per_env = {
    baseinfra = [],
    lab = [
      {
        principal_id   = local.infrastructure_group_principal_id,
        role           = local.reader_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.infrastructure_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      }
    ],
    devstg = [
      {
        principal_id   = local.infrastructure_group_principal_id,
        role           = local.reader_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.infrastructure_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.middleware_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.atg_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.hmi_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
        principal_id   = local.coretech_group_principal_id,
        role           = local.aks_rg_cluster_user_built_in_role,
        scope          = local.aks_rg_role_scope
        principal_type = local.group_principal_type
      },
      {
          principal_id   = local.escape_mod_app_principal_id,
          role           = local.aks_rg_cluster_admin_built_in_role,
          scope          = local.aks_rg_role_scope
          principal_type = local.service_principal_type
      }
    ],
    prod = []
  }
}