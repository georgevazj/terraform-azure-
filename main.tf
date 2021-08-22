terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
  client_id = var.client_id
  client_secret = var.client_secret
}

# Configure the Azure Key Vault
resource "azurerm_key_vault" "akv" {
  name = var.akv_name
  location = var.akv_location
  tenant_id = var.tenant_id
  enabled_for_disk_encryption = var.enabled_disk_encryption
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled = var.purge_protection_enabled
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get,Set,List",
    ]

    secret_permissions = [
      "Get,Set,List",
    ]

    storage_permissions = [
      "Get,Set,List",
    ]
  }

}