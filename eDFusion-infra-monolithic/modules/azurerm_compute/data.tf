data "azurerm_subnet" "subnet" {
  for_each = var.vms
  name = each.value.subnet_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}
data "azurerm_public_ip" "pip" {
  for_each = var.vms
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each = var.vms
  name = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_key_vault_secret" "admin_username" {
  for_each = var.vms
  name = each.value.username_key
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each = var.vms
  name = each.value.password_key
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
