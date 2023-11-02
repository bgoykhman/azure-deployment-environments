terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  skip_provider_registration = true
}

variable "resource_group_name" {}

variable "resource_name" {}

variable "location" {}

variable "tier" {}

variable "replication_type" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "example" {
  name                     = var.resource_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.tier
  account_replication_type = var.replication_type
}
