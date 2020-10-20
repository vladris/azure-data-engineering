mkdir ARM

az group export --name adx-rg --include-parameter-default-value | Out-File ./ARM/adx-rg.json