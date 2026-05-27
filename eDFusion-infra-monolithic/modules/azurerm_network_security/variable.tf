variable "nsgs" {
    type = map(object({
      nsg_name = string
      location = string
      resource_group_name = string

      tags = optional(map(string))

      nsg_rules = map(object({
        name = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = number
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
        
      }))
    }))
}