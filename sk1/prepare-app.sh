#!/bin/bash

az login -u barbora.kralovska@student.tuke.sk -p <password>

az group create --name myResourceGroup --location westus

az appservice plan create --name myAppServicePlan --resource-group myResourceGroup --sku S1 --is-linux

az webapp create --resource-group myResourceGroup --plan myAppServicePlan --name pgAdmin-exam2022 --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml

az storage account create --resource-group myResourceGroup --name mystorageaccount1412 --location eastus --sku Standard_LRS

az storage share create --name acishare --account-name mystorageaccount1412

STORAGE_KEY=$(az storage account keys list --account-name "mystorageaccount1412" --resource-group myResourceGroup --query [0].value -o tsv)

echo $STORAGE_KEY

echo "      storageAccountKey: $STORAGE_KEY" >> docker-compose.yml 

az webapp config storage-account add --access-key $STORAGE_KEY --account-name "mystorageaccount1412" --custom-id "customID" --share-name "acishare" --storage-type AzureFiles --name "pgAdmin-exam2022" --resource-group myResourceGroup
