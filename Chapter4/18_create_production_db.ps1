az kusto database create `
--cluster-name "adx$suffix" `
--database-name production `
--resource-group adx-rg `
--read-write-database `
location="Central US"

$prodsp = az ad sp create-for-rbac | ConvertFrom-Json

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name production `
--principal-id $prodsp.appId `
--principal-type App `
--role "Admin" `
--tenant-id $prodsp.tenant `
--principal-assignment-name adf `
--resource-group adx-rg
