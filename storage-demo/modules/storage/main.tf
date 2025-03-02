resource "azurerm_storage_account" "storage" {
  name                     = "phuongnv63"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "mycontainer"
  storage_account_id = azurerm_storage_account.storage.id
  container_access_type = "private"
}
