$group = az ad group show --group "EUPI data read only" | ConvertFrom-Json

$account = az account show | ConvertFrom-Json

echo "$($group.objectId);$($account.tenantId)"
