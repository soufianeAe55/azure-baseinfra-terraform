output "cottage_subnet_prefix_map" {
  description = "cottage subnet prefixes, by environment"
  value = {
    "lab": { for key in keys(local.cottages_lab) : key => local.cottages_lab[key]["subnet_address_prefix"] }
    "devstg": { for key in keys(local.cottages_devstg) : key => local.cottages_devstg[key]["subnet_address_prefix"] }
    "prod": { for key in keys(local.cottages_prod) : key => local.cottages_prod[key]["subnet_address_prefix"] }
  }
}