output "keyvault_subnets_configs" {
  description = "IDs for keyvault subnets across all environments"
  value = {
    "baseinfra" = {
      nsg_id    = module.keyvault_nsg["baseinfra"].nsg_id
      subnet_id = module.keyvault_subnet["baseinfra"].subnet_id
    }
    "lab" = {
      nsg_id    = module.keyvault_nsg["lab"].nsg_id
      subnet_id = module.keyvault_subnet["lab"].subnet_id
    }
    "devstg" = {
      nsg_id    = module.keyvault_nsg["devstg"].nsg_id
      subnet_id = module.keyvault_subnet["devstg"].subnet_id
    }
    "prod" = {
      nsg_id    = module.keyvault_nsg["prod"].nsg_id
      subnet_id = module.keyvault_subnet["prod"].subnet_id
    }
  }
}