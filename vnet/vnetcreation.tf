resource "azurerm_resource_group" "vprgcreate" {
  name     = "vnetrg"
  location = "West Europe"
}

resource "azurerm_network_security_group" "vpnsg" {
  name                = "vnetnsg01"
  location            = azurerm_resource_group.vprgcreate.location
  resource_group_name = azurerm_resource_group.vprgcreate.name
}

resource "azurerm_virtual_network" "vpvnet" {
  name                = "vnet01"
  location            = azurerm_resource_group.vprgcreate.location
  resource_group_name = azurerm_resource_group.vprgcreate.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet01"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet02"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.vpnsg.id
  }
}
#THis code is for vnet
#this is my second update to new branch
#This update is from github
