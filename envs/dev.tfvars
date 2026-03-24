## This is the development environment variable file, which contains variable values specific to the development environment.
## To use this file, pass the -var-file=dev.tfvars flag when running Terraform commands (e.g., terraform apply -var-file=dev.tfvars).
## Once passed, the variables defined in this file will override the default values specified in variable.tf for the development environment, allowing for environment-specific configurations without modifying the main variable definitions.

azurerm_resource_group_name = "mynova_rg_dev"
azurerm_resource_group_location = "Canada Central"
azurerm_virtual_network_name = "mynova_vnet_dev"
azurerm_subnet_name = "mynova_subnet_dev"
azurerm_network_security_group_name = "mynova_nsg_dev"
azurerm_public_ip_name = "mynova_public_ip_dev"
azurerm_network_interface_name = "mynova_nic_dev"
azurerm_linux_virtual_machine_name = "mynova_vm_dev"
azurerm_linux_virtual_machine_size = "Standard_B2ats_v2"
azurerm_linux_virtual_machine_admin_username = "azureuserdev"