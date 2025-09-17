variable "keyvault_subnet_address_prefix_map" {
  description = "keyvault subnet address prefix by environment"
  type = object({
    baseinfra = string
    lab = string
    devstg = string
    prod = string
  })
}