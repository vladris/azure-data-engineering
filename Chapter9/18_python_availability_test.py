from azure.kusto.data import KustoClient, KustoConnectionStringBuilder

cluster = '<your cluster URL>'

connectionBuilder = KustoConnectionStringBuilder.with_aad_device_authentication(cluster)

client = KustoClient(connectionBuilder)

database = 'telemetry'
query = 'Covid19 | where updated == "2020-02-29" | take 1 | summarize Result = count()'

result = client.execute(database, query)

#...