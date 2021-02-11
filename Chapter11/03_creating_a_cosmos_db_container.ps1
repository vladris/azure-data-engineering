az cosmosdb sql container create `
--name users `
--partition-key-path "/UserID" `
--database-name distribution `
--account-name "cosmosdb$suffix" `
--resource-group cosmosdb-rg
