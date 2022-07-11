variable "resource_group_name_prefix" {
  default       = "rg"
  description   = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default = "eastus2"
  description   = "Location of the resource group."
}

variable "username" {
    description = "Username for Virtual Machines"
    default     = "azureuser"
}

variable "password" {
    description = "Password for Virtual Machines"
}

variable "vmsize" {
    description = "Size of the VMs"
    default     = "Standard_DS1_v2"
}
