az group create `
--location "Central US" `
--name cosmosdb-rg

az cosmosdb create `
--name "cosmosdb$suffix" `
--resource-group cosmosdb-rg
