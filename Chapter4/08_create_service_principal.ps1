$sp = az ad sp create-for-rbac | ConvertFrom-Json

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name telemetry `
--principal-id $sp.appId `
--principal-type App `
--role "Admin" `
--tenant-id $sp.tenant `
--principal-assignment-name adf `
--resource-group adx-rg