terraform {

  required_version = ">= 1.9.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0" // version constraint required for AKS J2C module to work
    }
  }

}