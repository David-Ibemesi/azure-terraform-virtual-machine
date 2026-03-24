output "vm_public_ip" {
  description = "Public IP address of the created virtual machine"
  value       = azurerm_public_ip.mynova_public_ip.ip_address
}

output "vm_sku" {
  description = "Details of the virtual machine image used"
  value       = azurerm_linux_virtual_machine.mynova_vm.source_image_reference
}

output "vm_username" {
  description = "Admin username for SSH access"
  value       = azurerm_linux_virtual_machine.mynova_vm.admin_username
}

output "vm_size" {
  description = "Size of the deployed virtual machine"
  value       = azurerm_linux_virtual_machine.mynova_vm.size
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.mynova_rg.name
}

output "resource_group_location" {
  description = "Location of the resource group"
  value       = azurerm_resource_group.mynova_rg.location
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.mynova_vnet.name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = azurerm_subnet.mynova_subnet.name
}

output "nsg_name" {
  description = "Name of the network security group"
  value       = azurerm_network_security_group.mynova_nsg.name
}

output "vm_id" {
  description = "Resource ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.mynova_vm.id
}