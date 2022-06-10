variable "resource_group_name" {
    type = string
}

variable "cluster_name_prefix" {
    type = string
    description = "Prefix to use for the Azure Cache for Redis Enterprise cluster. Will be suffixed by the region name."
}

variable "regions" {
    type = list
    description = "List of regions to use for Active Geo Replication"
    default = ["eastus", "westus", "centralus"]
}

