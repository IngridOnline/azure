terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "e20db9a0-dfc7-4b7e-9d76-bb61061b5c9e"
  features {}
}



module "ressursgruppe" {
  source = "./oppg2"
}

module "nettverk" {
  source             = "./oppg2-nettverk"
  vnet_name          = "virtuelt-nettverk"
  vnet_adressSpace   = "10.0.0.0/16"
  subnet_name        = "virtuelt-nettverk-subnet"
  subnet_adressSpace = "10.0.0.0/16"
  subnets = {
    "subnet1" = {
      name          = "testing"
      address_space = ["10.0.0.0/24"]
    }
    "subnet2" = {
      name          = "testing2"
      address_space = ["10.0.1.0/24"]
    }
  }

}