
variable "vms" {
  type = map(object({
    vm_name                       = string
    location                      = string
    resource_group_name           = string
    size                          = string
    kv_name                       = string
    username_key                  = string
    password_key                  = string
    nsg_name                      = string
    vnet_name                     = string
    subnet_name                   = string
    pip_name                      = string
    nic_name                      = string
    ip_config_name                = string
    private_ip_address_allocation = string
    caching                       = string
    storage_account_type          = string

    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
}
