variable "gateway_uid_principal_id_map" {
  description = "A map containing the principal ID of the user-assigned identity for the gateway in the baseinfra environment."
  type = object({
    baseinfra = string
  })
  default = null
}

variable aks_uid_principal_id_map {
  description = "A map containing the full resource IDs of user-assigned identities for AKS clusters in different environments (dev, devstg, prod)."
  type = object({
    lab    = string
    devstg = string
    devstg-kv-baseinfra = string
    prod   = string
  })
  default = null
}