az group create --location "Central US" --name adf-rg

az extension add --name datafactory

az datafactory factory create `
--location "Central US" `
--name "adf$suffix" `
--resource-group adf-rg
