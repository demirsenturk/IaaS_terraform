Resource "azurerm_virtual_network" "mainnetwork" {
  name = "mainnetwork"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "test_subnet" {
    name = "${lookup(element(var.subnet_prefix, count.index), "name")}"
    count = "${length(var.subnet_prefix)}"
    resource_group_name = var.resource_group_name
    virtual_network_name = var.vnet_name
    address_prefix = "${lookup(element(var.subnet_prefix, count.index), "ip")}"
}