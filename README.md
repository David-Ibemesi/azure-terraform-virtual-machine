**Project Description** **3/24/2026**

This is a self made environment to practice the basics of terraform while using git


**Project Structure**

root-
  |-envs-|
  |     |--dev.tf (used to store the variables needed to deploy a development environment)
  |     |--prod.tf (stores the variables needed to deploy the production environment)
  |-main.tf  (contains the main code to deploy resources)
  |-output.tf  (specifies the information to be shown when resources are deployed)
  |-provider.tf  (shows which cloud provider should be used for this project)
  |-README.md  (current file, displays basic information about the project)
  |-terraform.tfvars  u(sed by default when deploying files, contains variable information for resources)
  |-variable.tf  (used to store code variables and prevent hardcoding) *intentionally "variable" and not "variables" for crash test*


**Project Goal**

Deploy a publically accessible virtual machine (VM) on Azure with best practices involving:
1. Sensitive passwords
2. Avoiding hardcoding values
3. Making main.tf reusable, having all dynamic values live in other variable files

**Structure of main.tf**

Here's the structure of the main terraform file and why it is designed that way:
1. Resource Group *This is a logical container for all resources being created*
2. Virtual Network (VNET) *This is a symbolic network in the container used to group resources*
3. Subnet *An avenue for resource connections within the VNET*
4. Network Security Group (NSG) *Important for setting security and accessibility framework*
6. Public IP Address *Creates an attacheable public identity for the VM*
7. Network Interface Card (NIC) *This maps the VM to the Public IP*
5. Associate NIC with NSG *This makes sure the instances attached to the NIC has a security detail*
8. Virtual Machine Instance *A remote machine having a preinstallled operating system ready for use*
