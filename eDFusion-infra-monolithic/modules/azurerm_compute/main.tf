resource "azurerm_network_interface" "vm-nic" {
  for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  # depends_on = [data.azurerm_public_ip.pip  ]

  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.subnet [each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip [each.key].id
    
    }
  }

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms
  name = each.value.vm_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size

  admin_username = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password = data.azurerm_key_vault_secret.admin_password[each.key].value

  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.vm-nic[each.key].id]

  os_disk {
  caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }
  source_image_reference {
    publisher = each.value.publisher
    offer = each.value.offer
    sku = each.value.sku
    version =   each.value.version
  }
}
      
    
