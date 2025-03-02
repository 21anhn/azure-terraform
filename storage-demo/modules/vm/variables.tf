variable "location" {
  type    = string
  description = "Azure region where the VM will be created."
}

variable "resource_group_name" {
  type    = string
  description = "The name of the resource group."
}

variable "vm_name" {
  type    = string
  description = "The name of the Windows VM."
  default = "my-windows-vm"
}

variable "vm_size" {
  type    = string
  description = "Azure VM size."
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type    = string
  description = "Admin username for the VM."
  default = "adminuser"
}

variable "admin_password" {
  type      = string
  description = "Admin password for the VM."
  sensitive = true
}

variable "subnet_id" {
  type    = string
  description = "The subnet ID where the VM's NIC will be attached."
}
