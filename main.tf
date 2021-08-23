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
  skip_provider_registration = true
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current"{}

data "azurerm_resource_group" "rsg" {
  name = var.resource_group_name
}

# Configure the Azure Key Vault
resource "azurerm_key_vault" "akv" {
  name = var.akv_name
  resource_group_name = data.azurerm_resource_group.rsg.name
  location = data.azurerm_resource_group.rsg.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = var.enabled_disk_encryption
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled = var.purge_protection_enabled

  sku_name = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get","list","set"
    ]

    secret_permissions = [
      "get","list","set"
    ]

    storage_permissions = [
      "get","list","set"
    ]
  }

}