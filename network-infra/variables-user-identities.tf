variable "aks_uid_principal_id_map" {
  description = "A map containing the principal IDs of user-assigned identities for AKS clusters in different environments."
  type = object({
    lab = string
    devstg = string
    prod = string
  })
  default = null
}