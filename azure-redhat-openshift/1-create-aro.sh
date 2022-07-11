#!/bin/bash

rg_aro_name='rg-aro-lab'
vnet_aro_name='aro-vnet'
location='eastus2'
cluster='aro-cluster'

az group create --name $rg_aro_name --location $location --tags level=low
az network vnet create \
   --resource-group $rg_aro_name \
   --name $vnet_aro_name \
