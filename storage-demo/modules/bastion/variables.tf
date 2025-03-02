variable "location" {
  type        = string
  description = "Azure region where the Bastion Host will be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "bastion_name" {
  type        = string
  description = "The name of the Azure Bastion host."
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID where the Bastion will be deployed."
}

variable "public_ip_id" {
  type        = string
  description = "The ID of the public IP to associate with the Bastion."
}
