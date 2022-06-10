resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "${var.regions[0]}"
}

resource "azurerm_redis_enterprise_cluster" "cluster" {
  for_each = toset(var.regions)
  name                = "${var.cluster_name_prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = each.key

  sku_name = "Enterprise_E10-2"
}

resource "azurerm_redis_enterprise_database" "database" {
  name                = "default"

  cluster_id        = azurerm_redis_enterprise_cluster.cluster["${var.regions[0]}"].id
  client_protocol   = "Encrypted"
  clustering_policy = "EnterpriseCluster"
  eviction_policy   = "NoEviction"
  port              = 10000

  linked_database_id = [for c in azurerm_redis_enterprise_cluster.cluster : "${c.id}/databases/default"]
  linked_database_group_nickname = "geoGroup"
}