# assign
rgs = {
  rg1 = {
    name       = "apple_rg"
    location   = "westus"
    managed_by = "techMElogy"
    tags = {
      env   = "dev"
      owner = "amit"
    }
  }
  rg2 = {
    name     = "mango_rg"
    location = "westus"

  }
}
stgs = {
  stg1 = {
    name                     = "stg1985"
    location                 = "westus"
    resource_group_name      = "apple_rg"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
pips = {
  pip1 = {
    pip_name            = "edfusion_pip"
    location            = "westus"
    resource_group_name = "apple_rg"
    allocation_method   = "Static"
  }
}
vnets = {
  v1 = {
    vnet_name           = "edfusion_vnet"
    location            = "westus"
    resource_group_name = "apple_rg"
    address_space       = ["10.0.0.0/16"]

  }
}
vms = {
  vm1 = {
    vm_name      = "edfusion-frontend-vm"
    subnet_name  = "edfusion_frontend_subnet"
    vnet_name    = "edfusion_vnet"
    size         = "Standard_D2s_v3"
    kv_name      = "edfusion-kv-12"
    username_key = "vm-username-12"
    password_key = "vm-user-password-12"
    publisher    = "Canonical"
    offer        = "0001-com-ubuntu-server-jammy"
    sku          = "22_04-lts"
    version      = "latest"

    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    pip_name                      = "edfusion_pip"
    nic_name                      = "edfusion_frontendvm_nic"
    location                      = "westus"
    resource_group_name           = "apple_rg"
    private_ip_address_allocation = "Dynamic"
    ip_config_name                = "edfusion_ip_config_vm"
    nsg_name                      = "edFusion_nsg_rule"

  }
}
subnets = {
  s1 = {
    subnet_name         = "edfusion_frontend_subnet"
    resource_group_name = "apple_rg"
    vnet_name           = "edfusion_vnet"
    address_prefixes    = ["10.0.6.0/24"]
    nsg_name            = "edFusion_nsg_rule1"
  }
  s2 = {
    subnet_name         = "edfusion_backend_subnet"
    resource_group_name = "apple_rg"
    vnet_name           = "edfusion_vnet"
    address_prefixes    = ["10.0.7.0/24"]
    nsg_name            = "edFusion_nsg_rule2"
  }
}
key_vaults = {
  kv1 = {
    name                        = "edfusion-kv-12"
    location                    = "westus"
    resource_group_name         = "apple_rg"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

    secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]

    storage_permissions = ["Get", "Delete"]

  }
}
nsgs = {
  nsg1 = {
    nsg_name            = "edFusion_nsg_rule1"
    location            = "westus"
    resource_group_name = "apple_rg"
    tags = {
      environment = "Production"
    }
    nsg_rules = {
      nsg_rule1 = {
        name                       = "ssh_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "22"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      nsg_rule2 = {
        name                       = "https_rule"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "80"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
  } }
  nsg2 = {
    nsg_name            = "edFusion_nsg_rule2"
    location            = "westus"
    resource_group_name = "apple_rg"
    tags = {
      environment = "Production"
    }
    nsg_rules = {
      nsg_rule1 = {
        name                       = "ssh_rule"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "22"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
      nsg_rule2 = {
        name                       = "https_rule"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "80"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
  } }
}
mssql_database = {
  mssqldb = {
    name                = "edfusion-mssql-database-0"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    mssqlserver_name    = "edfusion-mssql-server-0"
    resource_group_name = "apple_rg"
  }
}
mssql_server = {
  mssqlserver = {
    name                = "edfusion-mssql-server-0"
    resource_group_name = "apple_rg"
    location            = "westus"
    version             = "12.0"
    minimum_tls_version = "1.2"
    kv_name             = "edfusion-kv-12"
    username_sqlkey     = "sql-username-12"
    password_sqlkey     = "mssql-password-12"
  }
}
