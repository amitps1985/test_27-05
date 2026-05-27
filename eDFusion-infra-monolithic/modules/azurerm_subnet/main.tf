resource "azurerm_subnet" "subnet" {
  for_each = var.subnets
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes = each.value.address_prefixes
}

data "azurerm_network_security_group" "nsg" {
  for_each = var.subnets
  name = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
  }

  resource "azurerm_subnet_network_security_group_association" "assoc" {
    for_each = var.subnets
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}