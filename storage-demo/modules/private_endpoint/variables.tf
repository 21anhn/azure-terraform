variable "location" {
  type    = string
  description = "Azure region where the Private Endpoint will be created."
}

variable "resource_group_name" {
  type    = string
  description = "The name of the resource group."
}

variable "private_endpoint_name" {
  type    = string
  description = "The name of the Private Endpoint."
  default = "storage-private-endpoint"
}

variable "subnet_id" {
  type    = string
  description = "The subnet ID where the Private Endpoint will be created."
}

variable "storage_account_id" {
  type    = string
  description = "The ID of the Azure Storage Account."
}

variable "vnet_id" {
  type    = string
  description = "The Virtual Network ID where the Private DNS will be linked."
}
