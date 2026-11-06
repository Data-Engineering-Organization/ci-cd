resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-${var.base_name}"
  location = var.base_location
}