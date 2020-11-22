# Among-Us-Tracker-Cosmos-Db Database
Cosmos DB for storing Among Us Tracker data. This database is utilised by many Among Us Tracker Functions hosted in Azure.

## Cosmos DB (Table API)
I used CosmosDB using Table API as my data needs doesn't need to be low latency and high performance, but instead needs to be low cost. Using the Free Tier in Azure for CosmosDB and using this API means my monthly costs for storing this data is pennies, if anything. 

I also considered an in-application sql lite file in context of the consumer functions of this database, but didn't persue this as it does not allow future scaling in Azure of functions if the data lives with their instances rather than being persisted elsewhere.

By using table api, I am paying for transactions rather than CPU and RAM.

## Good Reads
- https://blog.siliconvalve.com/2018/12/14/cost-effective-azure-cosmos-db/
- https://docs.microsoft.com/en-au/azure/storage/tables/table-storage-overview
- https://www.troyhunt.com/working-with-154-million-records-on/
