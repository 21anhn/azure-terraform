variable "location" {
  type    = string
  description = "Azure region where the Storage Account will be created."
}

variable "resource_group_name" {
  type    = string
  description = "The name of the resource group."
}

variable "storage_account_name" {
  type    = string
  description = "The name of the Azure Storage Account."
  default = "mystorageacct123"
}

variable "container_name" {
  type    = string
  description = "The name of the container inside the storage account."
  default = "mycontainer"
}
