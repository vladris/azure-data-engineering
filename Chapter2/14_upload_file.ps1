echo "Hello world!" | Out-File -FilePath hello.txt

az storage fs file upload --account-name "adls$suffix" --file-system fs1 --path hello.txt --source hello.txt