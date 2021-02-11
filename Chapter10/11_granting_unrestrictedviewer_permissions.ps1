$me = az ad signed-in-user show --query objectId

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name telemetry`
--principal-id $me `
--principal-type User `
--role UnrestrictedViewers `
--principal-assignment-name userprofilesmeunrestrictedviewer `
--resource-group adx-rg
