$adxendpoing = az devops service-endpoint create --service-endpoint-configuration config.json

rm config.json

az devops service-endpoint update --id $adxendpoint.id --enable-for-all