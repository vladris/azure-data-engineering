$telemetry = az kusto database show --cluster-name "adx$suffix" --database-name telemetry --resource-group adx-rg | ConvertFrom-Json
 
echo $telemetry.id
