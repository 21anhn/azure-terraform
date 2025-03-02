output "vnet_vm_id" {
  value = azurerm_virtual_network.vnet_vm.id
}

output "vnet_storage_id" {
  value = azurerm_virtual_network.vnet_storage.id
}

output "subnet_vm_id" {
  value = azurerm_subnet.subnet_vm.id
}

output "subnet_private_endpoint_id" {
  value = azurerm_subnet.subnet_private_endpoint.id
}
output "subnet_bastion_id" {
  value = azurerm_subnet.subnet_bastion.id
}
