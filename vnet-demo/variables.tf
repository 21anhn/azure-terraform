variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "vnet1_name" {
  description = "The name of the first virtual network"
  type        = string
}

variable "vnet1_address_space" {
  description = "The address space for the first virtual network"
  type        = list(string)
}

variable "vnet1_subnet_name" {
  description = "The name of the first subnet"
  type        = string
}

variable "vnet1_subnet_address_prefix" {
  description = "The address prefix for the first subnet"
  type        = list(string)
}

variable "vnet2_name" {
  description = "The name of the second virtual network"
  type        = string
}

variable "vnet2_address_space" {
  description = "The address space for the second virtual network"
  type        = list(string)
}

variable "vnet2_subnet_name" {
  description = "The name of the second subnet"
  type        = string
}

variable "vnet2_subnet_address_prefix" {
  description = "The address prefix for the second subnet"
  type        = list(string)
}

# VM 1 variables
variable "vm1_name" {
  description = "The name of the first virtual machine"
  type        = string
}

variable "vm1_size" {
  description = "The size of the first virtual machine"
  type        = string
}

variable "vm1_admin_username" {
  description = "The admin username for the first virtual machine"
  type        = string
}

variable "vm1_public_ssh_key" {
  description = "The public SSH key for the first virtual machine"
  type        = string
}

variable "vm1_nic_name" {
  description = "The name of the network interface for the first virtual machine"
  type        = string
}

# VM 2 variables
variable "vm2_name" {
  description = "The name of the second virtual machine"
  type        = string
}

variable "vm2_size" {
  description = "The size of the second virtual machine"
  type        = string
}

variable "vm2_admin_username" {
  description = "The admin username for the second virtual machine"
  type        = string
}

variable "vm2_public_ssh_key" {
  description = "The public SSH key for the second virtual machine"
  type        = string
}

variable "vm2_nic_name" {
  description = "The name of the network interface for the second virtual machine"
  type        = string
}

variable "vm_tags" {
  description = "Tags for the virtual machines"
  type        = map(string)
}

variable "subscription_id" {
  type = string
}
