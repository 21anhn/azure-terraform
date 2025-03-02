provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source  = "./modules/network"
  location = var.location
  resource_group_name = var.resource_group_name
}

module "vm" {
  source              = "./modules/vm"
  location           = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_vm_id
  admin_password      = var.admin_password
}

module "public_ip" {
  source              = "./modules/public_ip"
  location           = var.location
  resource_group_name = var.resource_group_name
}

module "bastion" {
  source              = "./modules/bastion"
  location           = var.location
  resource_group_name = var.resource_group_name
  bastion_name        = "bastion-host"
  subnet_id           = module.vnet.subnet_bastion_id
  public_ip_id        = module.public_ip.public_ip_id
}


module "storage" {
  source              = "./modules/storage"
  location           = var.location
  resource_group_name = var.resource_group_name
}

module "private_endpoint" {
  source             = "./modules/private_endpoint"
  location          = var.location
  resource_group_name = var.resource_group_name
  subnet_id          = module.vnet.subnet_vm_id
  vnet_id            = module.vnet.vnet_vm_id
  storage_account_id = module.storage.storage_account_id
}

