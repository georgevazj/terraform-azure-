# Azure authentication
variable "subscription_id" {
  type = string
  description = "(Required) Azure subscription id"
}

variable "tenant_id" {
  type = string
  description = "(Required) Azure tenant id"
}

variable "client_id" {
  type = string
  description = "(Required) Service principal client id"
}

variable "client_secret" {
  type = string
  description = "(Required) Service principal client secret"
}

# Azure resource group
variable "resource_group_name" {
  type = string
  description = "(Required) Resource group name"
}

variable "akv_name" {
  type = string
  description = "(Required) Key Vault name"
}

variable "akv_location" {
  type = string
  description = "(Required) Key Vault Location"
}

variable "enabled_disk_encryption" {
  type = bool
  description = "Enable disk encryption"
  default = true
}

variable "soft_delete_retention_days" {
  type = number
  description = "(Optional) Soft delete retention days. Default: 7"
  default = 7
}

variable "purge_protection_enabled" {
  type = bool
  description = "(Optional) Enable purge protection. Default: false"
  default = false
}

variable "sku_name" {
  type = string
  description = "(Optional) Storage account SKU. Default: standard"
  default = "standard"
}