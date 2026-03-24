## This is the default variable file used, preceeding variable.tf, dev.tf and prod.tf
## The variables defined here are used in the main.tf file and can be overridden by environment-specific variable files (dev.tf, prod.tf) for different deployment scenarios.
## The names of the variables in this file should match the variable names defined in variable.tf to ensure proper variable assignment during Terraform execution.
## Those names in the variable.tf file can be anything, but should be descriptive of the variable's purpose for better readability and maintainability of the Terraform codebase.

azurerm_resource_group_name                  = "mynova_rg_test"
azurerm_resource_group_location              = "Canada Central"
azurerm_virtual_network_name                 = "mynova_vnet_test"
azurerm_subnet_name                          = "mynova_subnet_test"
azurerm_network_security_group_name          = "mynova_nsg_test"
azurerm_public_ip_name                       = "mynova_public_ip_test"
azurerm_network_interface_name               = "mynova_nic_test"
azurerm_linux_virtual_machine_name           = "mynova_vm_test"
azurerm_linux_virtual_machine_size           = "Standard_B2ats_v2"
azurerm_linux_virtual_machine_admin_username = "azureusertest"
allowed_ssh_ips                              = ["0.0.0.0/0"]
environment                                  = "test"