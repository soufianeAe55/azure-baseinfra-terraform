terraform {

  required_version = ">= 1.9.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116" // AKS related module constraint
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
  }

}

provider "azuredevops" {
  org_service_url = var.organization_url
  personal_access_token = var.personal_access_token
}