
provider "azurerm" {
    subscription_id = "e20db9a0-dfc7-4b7e-9d76-bb61061b5c9e"
  features {}
}

variable "resource_group_name" {
  default = "test"
}

variable "location_name"{
  default = "West Europe"
}

resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location_name

}

output "resource_group_id" {
  value = azurerm_resource_group.test.id
}

