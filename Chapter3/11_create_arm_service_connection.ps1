$acc = az account show | ConvertFrom-Json

$env:AZURE_DEVOPS_EXT_AZURE_RM_SERVICE_PRINCIPAL_KEY=$sp.password

$serviceendpoint = az devops service-endpoint azurerm create --azure-rm-service-principal-id $sp.appId --azure-rm-subscription-id $acc.id --azure-rm-subscription-name $acc.name --azure-rm-tenant-id $acc.tenantId --name ARM | ConvertFrom-Json