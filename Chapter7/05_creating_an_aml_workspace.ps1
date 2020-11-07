az extension add -n azure-cli-ml

az group create `
--location "Central US" `
--name aml-rg

az ml workspace create `
--workspace-name aml `
--location "Central US" `
--resource-group aml-rg 
