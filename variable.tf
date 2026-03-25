variable "azurerm_resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
  default     = "mynova_rg"
}

variable "azurerm_resource_group_location" {
  description = "The name of the location where the resources would be deployed."
  type        = string
  default     = "Canada Central"
}

variable "azurerm_virtual_network_name" {
  description = "The name of the virtual network where resources would be procured."
  type        = string
  default     = "mynova_vnet"
}

variable "azurerm_virtual_network_address_space" {
  description = "This is the CIDR block which the virtual network posseses."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azurerm_subnet_name" {
  description = "The name of the subnet where resources would be procured."
  type        = string
  default     = "mynova_subnet"
}

variable "azurerm_subnet_address_prefixes" {
  description = "This is the CIDR block which the subnet posseses."
  type        = string
  default     = "10.0.1.0/24"
}

variable "azurerm_network_security_group_name" {
  description = "The name of the network security group where resources would be procured."
  type        = string
  default     = "mynova_nsg"
}

variable "azurerm_public_ip_name" {
  description = "The name of the public IP where resources would be procured."
  type        = string
  default     = "mynova_public_ip"
}

variable "azurerm_public_ip_allocation_method" {
  description = "The type of public IP to be procured."
  type        = string
  default     = "Static"
}

variable "azurerm_network_interface_name" {
  description = "The name of the network interface where resources would be procured."
  type        = string
  default     = "mynova_nic"
}

variable "azurerm_linux_virtual_machine_name" {
  description = "The name of the Linux virtual machine where resources would be procured."
  type        = string
  default     = "mynovavm"
}

variable "azurerm_linux_virtual_machine_size" {
  description = "The size of the Linux virtual machine to be procured."
  type        = string
  default     = "Standard_B2ats_v2"
}

variable "azurerm_linux_virtual_machine_admin_username" {
  description = "This is the hostname used with ssh"
  type        = string
  default     = "azureuser"
}

variable "azurerm_linux_virtual_machine_admin_password" {
  description = "The secret key to log into the virtual machine with ssh"
  type        = string
  sensitive   = true
  validation {
    condition     = length(var.azurerm_linux_virtual_machine_admin_password) >= 8
    error_message = "Password must be at least 8 characters long."
  }
}

variable "allowed_ssh_ips" {
  description = "List of IP addresses or CIDR blocks allowed to SSH into the VM"
  type        = list(string)
  default     = ["0.0.0.0/0"] # WARNING: Allows from anywhere - restrict in production!
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
  default     = "dev"
}

