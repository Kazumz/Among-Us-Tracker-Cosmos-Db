provider "azurerm" {
  version = "=2.35.0"
  features {}
}

resource "azurerm_resource_group" "au-cosmos-db" {
  name     = "au-cosmos-db-rg"
  location = "westus"
}

resource "azurerm_cosmosdb_account" "au-cosmos-db" {
  name                = "au-cosmos-db"
  location            = azurerm_resource_group.au-cosmos-db.location
  resource_group_name = azurerm_resource_group.au-cosmos-db.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  enable_free_tier	  = "true"
  
  capabilities {
    name = "EnableTable"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = "westus"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_table" "au-cosmos-db" {
  name                = "au-cosmos-table"
  resource_group_name = azurerm_resource_group.au-cosmos-db.name
  account_name        = azurerm_cosmosdb_account.au-cosmos-db.name
  throughput          = 400
}

output "cosmosdb_connectionstrings" {
   value = azurerm_cosmosdb_account.au-cosmos-db.connection_strings
   sensitive   = true
}