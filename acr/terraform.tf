terraform {

  required_version = ">= 1.9.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116" // version constraint required by ACR J2C module
    }
  }

}