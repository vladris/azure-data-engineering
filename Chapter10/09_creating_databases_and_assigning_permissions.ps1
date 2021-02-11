az kusto database create `
--cluster-name "adx$suffix" `
--database-name servicehealth `
--resource-group adx-rg `
--read-write-database location="Central US"

az kusto database create `
--cluster-name "adx$suffix" `
--database-name orders `
--resource-group adx-rg `
--read-write-database location="Central US"

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name servicehealth `
--principal-id "Feature data read only" `
--principal-type Group `
--role "Viewer" `
--principal-assignment-name servicehealthfeaturedataviewer `
--resource-group adx-rg

az kusto database-principal-assignment create `
--cluster-name "adx$suffix" `
--database-name orders `
--principal-id "EUPI data read only" `
--principal-type Group `
--role "Viewer" `
--principal-assignment-name orderseupiviewer `
--resource-group adx-rg
