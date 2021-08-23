variable "resource_group_name" {
  type = string
  description = "(Required) Target resource group name"
}

variable "akv_name" {
  type = string
  description = "(Required) Key Vault name"
}

variable "location" {
  type = string
  description = "(Required) Key Vault location"
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