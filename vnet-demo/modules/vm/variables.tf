variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the VM"
  type        = string
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "admin_username" {
  description = "The username for the VM admin"
  type        = string
}

variable "public_ssh_key" {
  description = "The public SSH key for the admin"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to assign the VM"
  type        = string
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "publisher" {
  type = string
}

variable "offer" {
  type = string
}

variable "sku" {
  type = string
}

variable "storage_image_reference_version" {
  type = string
}

variable "os_type" {
  type = string
}