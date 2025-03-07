provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# VNet Module 1
module "vnet1" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vnet_name           = var.vnet1_name
  address_space       = var.vnet1_address_space
  subnet_name        = var.vnet1_subnet_name
  subnet_address_prefix = var.vnet1_subnet_address_prefix
}

# VNet Module 2
module "vnet2" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vnet_name           = var.vnet2_name
  address_space       = var.vnet2_address_space
  subnet_name        = var.vnet2_subnet_name
  subnet_address_prefix = var.vnet2_subnet_address_prefix
}


module "ssh_key" {
  source = "./modules/ssh_key"
}

# VM Module 1
module "vm1" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  subnet_id           = module.vnet1.subnet_id
  vm_name             = var.vm1_name
  vm_size             = var.vm1_size
  admin_username      = var.vm1_admin_username
  public_ssh_key      = module.ssh_key.public_key_openssh
  nic_name            = var.vm1_nic_name
  os_type = "linux"
  publisher = "Canonical"
  offer = "0001-com-ubuntu-server-jammy"
  sku = "22_04-lts-gen2"
  storage_image_reference_version = "latest"
}

# VM Module 2
module "vm2" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  subnet_id           = module.vnet2.subnet_id
  vm_name             = var.vm2_name
  vm_size             = var.vm2_size
  admin_username      = var.vm2_admin_username
  public_ssh_key      = module.ssh_key.public_key_openssh
  nic_name            = var.vm2_nic_name
  os_type = "window"
  publisher = "MicrosoftWindowsServer"
  offer = "WindowsServer"
  sku = "2019-Datacenter"
  storage_image_reference_version = "latest"
}

# VNet Peering for vnet1 to vnet2
resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  name                      = "vnet1-to-vnet2"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = module.vnet1.vnet_name
  remote_virtual_network_id = module.vnet2.vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

# VNet Peering for vnet2 to vnet1
resource "azurerm_virtual_network_peering" "vnet2_to_vnet1" {
  name                      = "vnet2-to-vnet1"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = module.vnet2.vnet_name
  remote_virtual_network_id = module.vnet1.vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

