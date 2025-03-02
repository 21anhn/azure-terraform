# Virtual Network for VM
resource "azurerm_virtual_network" "vnet_vm" {
  name                = "vnet-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

# Subnet for VM
resource "azurerm_subnet" "subnet_vm" {
  name                 = "subnet-vm"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_vm.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_vm.name
  address_prefixes     = ["10.0.2.0/24"]
}


# Virtual Network for Storage
resource "azurerm_virtual_network" "vnet_storage" {
  name                = "vnet-storage"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.1.0.0/16"]
}

# Subnet for Private Endpoint (Storage)
resource "azurerm_subnet" "subnet_private_endpoint" {
  name                 = "subnet-private-endpoint"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_storage.name
  address_prefixes     = ["10.1.1.0/24"]
}

# VNet Peering from VM to Storage
resource "azurerm_virtual_network_peering" "peer_vm_to_storage" {
  name                         = "peer-vm-to-storage"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet_vm.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_storage.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# VNet Peering from Storage to VM
resource "azurerm_virtual_network_peering" "peer_storage_to_vm" {
  name                         = "peer-storage-to-vm"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnet_storage.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet_vm.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
