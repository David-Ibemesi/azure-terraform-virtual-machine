output "vm_public_ip" {
  description = "This shows the ip address of the created virtual machine"
  value = azurerm_public_ip.mynova_public_ip.ip_address
}

output "vm_sku" {
  value = azurerm_linux_virtual_machine.mynova_vm.source_image_reference
  description = "This shows the details of the virtual machine used."
}
