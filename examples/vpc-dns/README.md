# Simple VPC

Configuration in this directory creates a VPC with subnets, but no NAT gateway.

All 3 subnets have a primary and secondary DNS server.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | The ID of the VPC |
| subnet\_ids | Specifies the subnet (Native OpenStack API) ID. |
