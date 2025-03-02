resource "azurerm_private_endpoint" "pe" {
  name                = "storage-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "storage-private-connection"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "storage_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = "dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_dns.name
  virtual_network_id    = var.vnet_id
}
