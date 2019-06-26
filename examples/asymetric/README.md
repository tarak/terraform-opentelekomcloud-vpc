# Simple VPC

Configuration in this directory creates a VPC with subnets distributed asymmetrically across availability zones.

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
