terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateRG01"
    storage_account_name = "tfstate01965229201"
    container_name       = "dev-tfstate"
    key                  = "dev-terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "ResourceGroup" {
  source        = "../../Modules/ResourceGroup"
  base_name     = "${var.base_name}"
  base_location = var.base_location
  environment   = var.environment
}

module "StorageAccount" {
  source        = "../../Modules/StorageAccount"
  resource_group_name = module.ResourceGroup.rg_name_out
  base_name     = "${var.base_name}"
  base_location = module.ResourceGroup.rg_location_out
  environment   = var.environment
}