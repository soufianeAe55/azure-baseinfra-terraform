locals {
  agent_pool_name = "${var.application}-aks-deploy-agp-${var.environment}"
  project_name = var.project_name
  aks_rg_name = "${var.application}-aks-rg-${var.environment}"
  aks_pool_rg_name = "${var.application}-aks-pool-rg-${var.environment}"
  aks_cluster_name = "${var.application}-aks-${var.environment}"
  aks_user_nodepool_name = "usernp"  // strict naming contraint on this name in AZ
  kubernetes_version = var.k8s_version
  aks_skus_per_env = {
    "prod"   = "Standard"
    "devstg" = "Standard"
    "lab"    = "Free"
  }
  aks_nodepool_ssd_enabled_per_env = {
    "prod"   = true
    "devstg" = false
    "lab"    = false
  }

  // At least one value MUST be specified
  diag_log_categories_per_env = {
    "lab"    = ["kube-audit-admin"]
    "devstg" = ["kube-audit-admin"]
    "prod"   = ["kube-audit-admin"]
  }
}


