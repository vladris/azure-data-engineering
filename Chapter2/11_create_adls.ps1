az group create --location "Central US" --name adls-rg

az storage account create --name "adls$suffix" --resource-group adls-rg --enable-hierarchical-namespace true