# How to deploy Azure Cache for Redis Enteprise with Active Geo Replication using Terraform

## Usage
```
terraform plan -out main.tfplan
terraform apply .\main.tfplan
```

## Note
The number of caches to create and which regions to use is controlled by the `regions` variable. This defaults to East US, West US, and Central US. I have not yet figured out a way to easily provide this on the command line.
