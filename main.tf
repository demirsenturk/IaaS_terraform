#Create the VNET 
resource "azurerm_virtual_network" "mainnetwork-dualstack" {
    name                = var.vnet_name
    location            = var.location
    resource_group_name = var.resource_group_name
    address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "test_subnets" {
    name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
    count = "${length(var.subnet_prefix)}"
    resource_group_name = var.resource_group_name
    virtual_network_name = var.vnet_name
    address_prefixes = "${lookup(element(var.subnet_prefix, count.index), "ip")}"
}

#Create the NSG
resource "azurerm_network_security_group" "IPv6-nsg" {
  name                = "IPv6-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
  name                       = "Port_80"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix    = "*"
  destination_address_prefix = "*"
  }
}