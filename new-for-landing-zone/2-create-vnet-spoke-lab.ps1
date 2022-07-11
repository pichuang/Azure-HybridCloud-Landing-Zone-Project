#!/usr/bin/env pwsh

# Variable
$rg_spoke_name = 'rg-azure-lab'
$vnet_spoke_name = 'aliez-vnet-spoke'


# Fixed variables
$rg_hub_name = 'rg-azure-critical'
$vnet_hub_name = 'aliez-vnet-hub'
$location = 'eastus2'

# Actions:
# 1. Create resource group `rg-azure-lab`
# 2. Create vnet `$hub_vnet_name` in `rg-azure-lab`
# 3. Peering vnet
# 4. Delete resource group `rg-azure-lab`

# 1. Create resource group `rg-azure-lab`
az group create --name $rg_spoke_name --location $location --tags level=low

# 2. Create vnet `$vnet_spoke_name` in $rg_spoke_name
az network vnet create --name $vnet_spoke_name --resource-group $rg_spoke_name --location $location --address-prefixes 10.100.0.0/16

# 3. Peering vnet
# Obtain the ID of the vnet in the hub resource group
$vnet_hub_id=$(az network vnet show --resource-group $rg_hub_name --name $vnet_hub_name --query id --out tsv)

# Obtain the ID of the vnet in the spoke resource group
$vnet_spoke_id=$(az network vnet show --resource-group $rg_spoke_name --name $vnet_spoke_name --query id --out tsv)

# Hub 2 Spoke
az network vnet peering create --name hub-to-spoke --resource-group $rg_hub_name --vnet-name $vnet_hub_name --remote-vnet $vnet_spoke_id --allow-vnet-access

# Spoke 2 Hub
az network vnet peering create --name spoke-to-hub --resource-group $rg_spoke_name --vnet-name $vnet_spoke_name --remote-vnet $vnet_hub_id --allow-vnet-access

