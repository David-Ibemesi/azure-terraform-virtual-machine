## This is the production environment variable file, which contains variable values specific to the production environment.
## To use this file, pass the -var-file=prod.tfvars flag when running Terraform commands (e.g., terraform apply -var-file=prod.tfvars).
## Once passed, the variables defined in this file will override the default values specified in variable.tf for the production environment, allowing for environment-specific configurations without modifying the main variable definitions.

azurerm_resource_group_name                  = "mynova_rg_prod"
azurerm_resource_group_location              = "Canada Central"
azurerm_virtual_network_name                 = "mynova_vnet_prod"
azurerm_subnet_name                          = "mynova_subnet_prod"
azurerm_network_security_group_name          = "mynova_nsg_prod"
azurerm_public_ip_name                       = "mynova_public_ip_prod"
azurerm_network_interface_name               = "mynova_nic_prod"
azurerm_linux_virtual_machine_name           = "mynovavm-prod"
azurerm_linux_virtual_machine_size           = "Standard_B2ats_v2"
azurerm_linux_virtual_machine_admin_username = "azureuserprod"
allowed_ssh_ips                              = ["YOUR_PUBLIC_IP/32"] # Replace with your actual IP for security
environment                                  = "prod"