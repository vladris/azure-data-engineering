az kusto cluster create `
--location "Central US" `
--cluster-name "adxdev$suffix" `
--resource-group adx-rg `
--sku name='Dev(No SLA)_Standard_D11_v2' capacity=1 tier='Basic'

$leader = az kusto cluster show `
--resource-group adx-rg --cluster-name "adx$suffix" | ConvertFrom-Json

az kusto attached-database-configuration create `
--attached-database-configuration-name telemetryConfiguration `
--cluster-name "adxdev$suffix" `
--location "Central US" `
--cluster-resource-id $leader.id `
--database-name telemetry `
--default-principals-modification-kind Union `
--resource-group adx-rg
