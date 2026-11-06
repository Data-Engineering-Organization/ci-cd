terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

resource "random_string" "random" {
  length  = 4
  upper   = false
  special = false
}
resource "azurerm_storage_account" "sa" {
  name                     = "${lower(var.base_name)}${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.base_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}