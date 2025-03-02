
variable "subscription_id" {
  type    = string
}
variable "location" {
  type    = string
  default = "southeastasia"
}

variable "resource_group_name" {
  type    = string
  default = "my-resource-group"
}

variable "admin_password" {
  type      = string
  description = "Admin password for the VM."
  default = "admin"
}
