module "aksuser_nodepool" {

  source              = "git@ssh.dev.azure.com:v3/ORG-NAME/escape-mod/terraform-azurerm-aksnodepoollinux-fork-nfa-ext//module?ref=master"

  aks_cluster_id = module.aks_cluster.aks_cluster_id
  kubernetes_cluster  = module.aks_cluster.aks_cluster_name
  kubernetes_cluster_resource_group_name = module.aks_rg.resource_group_name
  landing_zone_slug   = var.landing_zone_slug
  stack               = var.stack
  default_tags        = module.base_tagging.base_tags

  custom_name         = local.aks_user_nodepool_name
  environment         = var.environment

  add_node_pools = {
    main_nodepool = {
      nodepool_name       = "user"
      enable_auto_scaling = true
      custom_ca_trust_enabled = false
      nodepool_vm_size    = var.user_nodepool_vm_size
      nodepool_node_count = var.user_nodepool_initial_node_count
      node_min_count      = var.user_nodepool_node_min_count
      node_max_count      = var.user_nodepool_node_max_count
      agent_max_pods      = var.user_nodepool_agent_max_pods
      enable_nodepool_host_encryption = true  // ec policy mandated for vm disk encryption
      enable_node_public_ip = false           // exposition on public internet not required
      linux_os_config = {
        sysctl_config = {
          vm_max_map_count = 262144 //at least opensearch needs 262144 instead of basic 65K
        }
      }
      // kubelet_config {  not specified for now
      // }
      fips_enabled        = false   // not required in this context
      nodepool_mode       = "User"  // we create a user nodepool, system pool already exists
      kubelet_disk_type   = "OS"
      linux_message_of_the_day = "Welcome on ${var.application} AKS k8s ${var.environment} environment"
      node_network_profile = {
       application_security_group_ids = [var.k8s_application_security_group_id]
      }
      nodepool_os_disk_size_gb = var.user_nodepool_os_disk_size_gb
      nodepool_os_disk_type    = "Ephemeral"
      nodepool_os_sku          = "Ubuntu"
      nodepool_os_type         = "Linux"
      vmss_priority            = "Regular"
      nodepool_scale_down_mode = "Delete"
      ultra_ssd_enabled        = local.aks_nodepool_ssd_enabled_per_env[var.environment]
      vnet_subnet_id     = module.k8s_workload_subnets[0].subnet_id
      availability_zones = ["1", "2"]
      upgrade_settings = {
        max_surge = 1
        drain_timeout_in_minutes = 0
        node_soak_duration_in_minutes = 0
      }
    }
  }

  depends_on = [module.aks_cluster]

}