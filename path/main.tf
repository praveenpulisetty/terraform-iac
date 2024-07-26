resource "azurerm_resource_group" "testrg" {
  name     = "rg-tf-demo"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet-test" {
  address_space = "10.0.0.0/26"
  resource_group_name = resource.azurerm_resource_group.testrg
  location = resource.azurerm_resource_group.location
  name = vnettest

}

resource "azurerm_subnet" "snet1" {
  name = "public_snet"
  virtual_network_name = resource.azurerm_virtual_network.vnet-test.name
  resource_group_name = resource.azurerm_resource_group.testrg.name
  address_prefixes = "10.0.1.0/28"  
}

resource "azurerm_subnet" "snet2" {
  name = "private_snet"
  virtual_network_name = resource.azurerm_virtual_network.vnet-test.name
  resource_group_name = resource.azurerm_resource_group.testrg.name
  address_prefixes = "10.0.2.0/28" 
  
}

# Get Resources from a Resource Group
#data "azurerm_resource_group" "rg-kv" {
#  name = "rg-praveen"
#}

#data "azurerm_client_config" "current" {}

/*resource "azurerm_key_vault" "my-kv" {
  name                        = "terraformkvp"
  location                    = resource.azurerm_resource_group.testrg.location
  resource_group_name         = resource.azurerm_resource_group.testrg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}*/