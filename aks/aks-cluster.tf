module "aks_cluster" {

  source              = "git@ssh.dev.azure.com:v3/ORG-NAME/escape-mod/terraform-azurerm-aks-fork-nfa-ext//module?ref=master"
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  custom_name         = "${var.application}-aks-${var.environment}"
  location            = module.regions.location
  location_short      = module.regions.location_short
  resource_group_name = local.aks_rg_name
  default_tags        = module.base_tagging.base_tags
  diag_log_analytics_workspace_id = var.log_analytics_workspace_id

  identity_type = "UserAssigned"
  identity_ids = [var.aks_uid_id]
  
  kubelet_identity = {
    client_id                 = var.kubelet_identity.client_id
    object_id                 = var.kubelet_identity.object_id
    user_assigned_identity_id = var.kubelet_identity.user_assigned_identity_id
  }

  diag_log_categories	= local.diag_log_categories_per_env[var.environment]
  diag_metric_categories = ["AllMetrics"]

  kubernetes_version                  = local.kubernetes_version

  agents_count                        = null      // we use autoscaling, so we set to to null
  agents_min_count                    = var.system_node_pool_agent_min_count
  agents_max_pods                     = null      // optional, may be specified
  agents_max_count                    = var.system_node_pool_agent_max_count
  agents_size                         = var.system_node_pool_agent_size
  agents_type                         = "VirtualMachineScaleSets"  // more efficient, as it supports automatic scaling opposed to the alternative AvailabilitySet option
  enable_auto_scaling                 = true     // we want autoscaling for this system node pool

  scale_down_mode                     = "Delete"
  rbac_aad                            = true     // we do not activate Active directory RBAC integration for k8s
  rbac_aad_admin_group_object_ids     = ["323ca402-8cbf-4a1e-a055-65b3df7264d6"]      // SG-AZURE-ESCAPE-MOD-INFRASTRUCTURE GROUP ID
  rbac_aad_azure_rbac_enabled         = true     // ref above
  role_based_access_control_enabled   = true     // ref above
  workload_identity_enabled           = var.workload_identity_enabled
  network_plugin                      = "kubenet" // we choose simlpicity first, and do not require azure CNI advanced networking features
  network_policy                      = "calico"  // azure network policy only works with azure CNI. Mandatory non null value for J2C module
  vnet_subnet_id                      = module.k8s_workload_subnets[0].subnet_id
  sku_tier                            = local.aks_skus_per_env[var.environment]
  azure_policy_enabled                = true      // set to true because azure policy control enabled on EC environment
  key_vault_secrets_provider          = null      // we do not enable for now, but will be probably required
  private_cluster_enabled             = true      // we want AKS cluster API only exposed to internal network, for security reasons
  private_cluster_public_fqdn_enabled = false     // we do not want public FQDN exposed for this cluster
  node_application_security_group_ids = [var.k8s_application_security_group_id]

  ingress_application_gateway_enabled = false
  ingress_application_gateway_id      = var.ingress_application_gateway_id

  depends_on = [ module.aks_rg, module.k8s_workload_subnets, module.k8s_lb_subnet ]

  # Enforce host encryption
  enable_host_encryption = true
}
