locals {
  user_assigned_identities_rg_name = "${var.application}-user-assigned-identities-rg-${var.environment}"

  user_assigned_identities = {
    "gateway-baseinfra" = {
      component   = "gateway"
      environment = "baseinfra"
    },
    "aks-lab" = {
      component   = "aks"
      environment = "lab"
    },
    "aks-devstg" = {
      component   = "aks"
      environment = "devstg"
    },
    "aks-devstg-kv-baseinfra" = {
      component   = "aks-kv-baseinfra"
      environment = "devstg"
    },
    "aks-prod" = {
      component   = "aks"
      environment = "prod"
    }
  }
}