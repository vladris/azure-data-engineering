from azure.cosmos import CosmosClient
from sys import argv

endpoint = "<your endpoint URL>"
key = "<your access key>"

client = CosmosClient(endpoint, key)
database = client.get_database_client("distribution")
container = database.get_container_client("users")

query = f"SELECT c.Name FROM c WHERE c.UserID = {argv[1]}"

for item in container.query_items(query):
    print(item["Name"])
