$sp = az ad sp create-for-rbac | ConvertFrom-Json

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name telemetry `
--principal-id $sp.appId `
--principal-type App `
--role "Viewer" `
--tenant-id $sp.tenant `
--principal-assignment-name purview `
--resource-group adx-rg
