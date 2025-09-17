output "gateway_uid_principal_id_map" {
  description = "A map containing the principal ID of the user-assigned identity for the gateway in the baseinfra environment."
  value = {
    "baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["gateway-baseinfra"].principal_id
  }
}

output "gateway_uid_id_map" {
  description = "A map containing the full resource ID of the user-assigned identity for the gateway in the baseinfra environment."
  value = {
    "baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["gateway-baseinfra"].id
  }
}

output "gateway_uid_client_id_map" {
  description = "A map containing the client ID of the user-assigned identity for the gateway in the baseinfra environment."
  value = {
    "baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["gateway-baseinfra"].client_id
  }
}

output "aks_uid_principal_id_map" {
  description = "A map containing the principal IDs of user-assigned identities for AKS clusters in different environments (dev, devstg, prod)."
  value = {
    "lab"    = azurerm_user_assigned_identity.user_assigned_identities["aks-lab"].principal_id
    "devstg" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg"].principal_id
    "devstg-kv-baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg-kv-baseinfra"].principal_id
    "prod"   = azurerm_user_assigned_identity.user_assigned_identities["aks-prod"].principal_id
  }
}

output "aks_uid_id_map" {
  description = "A map containing the full resource IDs of user-assigned identities for AKS clusters in different environments (dev, devstg, prod)."
  value = {
    "lab"    = azurerm_user_assigned_identity.user_assigned_identities["aks-lab"].id
    "devstg" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg"].id
    "devstg-kv-baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg-kv-baseinfra"].id
    "prod"   = azurerm_user_assigned_identity.user_assigned_identities["aks-prod"].id
  }
}

output "aks_uid_client_id_map" {
  description = "A map containing the client IDs of user-assigned identities for AKS clusters in different environments (dev, devstg, prod)."
  value = {
    "lab"    = azurerm_user_assigned_identity.user_assigned_identities["aks-lab"].client_id
    "devstg" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg"].client_id
    "devstg-kv-baseinfra" = azurerm_user_assigned_identity.user_assigned_identities["aks-devstg-kv-baseinfra"].client_id
    "prod"   = azurerm_user_assigned_identity.user_assigned_identities["aks-prod"].client_id
  }
}