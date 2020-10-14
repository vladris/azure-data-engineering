echo "https://adls$suffix.blob.core.windows.net/fs1/;"

az storage account keys list --account-name "adls$suffix" --query [0].value