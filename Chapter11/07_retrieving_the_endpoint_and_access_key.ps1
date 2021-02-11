$acc = az cosmosdb show --name "cosmosdb$suffix" `
    --resource-group cosmosdb-rg | ConvertFrom-Json

$keys = az cosmosdb keys list --name "cosmosdb$suffix" `
    --resource-group cosmosdb-rg | ConvertFrom-Json

echo $acc.documentEndpoint
echo $keys.primaryReadonlyMasterKey
