az kusto database create `
--cluster-name "adxdev$suffix" `
--database-name prototyping `
--resource-group adx-rg `
--read-write-database location="Central US"    

az kusto database create `
--cluster-name "adxdev$suffix" `
--database-name development `
--resource-group adx-rg `
--read-write-database location="Central US"
