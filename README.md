# terraform-otc-vpc

Terraform module which creates VPC resources on Open Telekom Cloud (OTC)

This module uses the `terraform-terraform-label` to implement a strict naming convention. For more information see:

- [terraform-terraform-label](https://github.com/cloudposse/terraform-terraform-label)

## Usage

The module can be used as follows:

```
module "vpc" {
  source    = "git::https://github.com/tarak/terraform-otc-vpc.git?ref=master"
  namespace = "example"
  stage     = "prod"
  cidr      = "10.1.0.0/12"

  availability_zones = [
    "eu-de-01",
    "eu-de-02",
    "eu-de-03"
  ]

  gateway_ips = [
    "10.1.0.1",
    "10.1.2.1",
    "10.1.3.1",
  ]

  subnets = [
    "10.1.0.0/16",
    "10.1.2.0/16",
    "10.1.3.0/16",
  ]

  subnets_dns_list = [
    ["100.125.4.25", "8.8.8.8"],
    ["100.125.4.25", "8.8.8.8"],
    ["100.125.4.25", "8.8.8.8"]
  ]

}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes of the VPC label, e.g. `1`. | list | `[]` | no |
| availability_zones | A list of availability zones in the region. | list(string) | n/a | **yes** |
| convert\_case | Determines wether to convert all VPC label fields to lower case. | string | `"true"` | no |
| cidr | The cidr block of the desired VPC. | string | n/a | **yes** |
| delimiter | Delimiter to be used between `namespace`, `name`, `stage` and `attributes` VPC label fields. | string | `"-"` | no |
| enabled | Set to `"false"` to prevent the module from creating any resources. | string | `"true"` | no |
| gateway_ips | A list of gateway of the VPC subnets. | list(string) | n/a | **yes** |
| namespace | The namespace or ID of the label, e.g. `example` or `Example Ltd.`. | string | n/a | no |
| nat_gateway_enabled | Set to `"false"` to prevent the module from creating any NAT gateway resources. | string | `"true"` | no |
| nat_gateway_pool | The name of the pool from which to obtain the floating IP. | string | admin_external_net | no |
| nat_gateway_spec | The specification of the nat gateway, valid values are "1", "2", "3", "4". | string | 3 | no |
| stage | The stage or environment name of the VPC label, e.g. `prod`, `staging`, `dev`, or `test`. | string | n/a | no |
| subnets | A list of subnets inside the VPC. | list(string) | n/a | **yes** |
| subnets_dhcp_enable | list(string) | list(bool) | [true, true, true] | no |
| subnets_dns_list | A list of DNS servers to use for the subnets. | list | `[]` | no |
| subnets_primary_dns | A list of IP addresses of DNS server 1 on the subnets. | list(string) | `[]` | no |
| subnets_secondary_dns | A list of IP addresses of DNS server 2 on the subnets. | list(string) | `[]` | no |
| tags | Additional tags of the VPC label, e.g. `map("BusinessUnit","XYZ")`. | map | `{}` | no |

## Outputs

> Note: All outputs will be emtpy strings when `"enabled"` is set to `"false"`.

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC. |
| subnet_ids | List of IDs of subnets. |

## Versioning

[Semantic versioning](http://semver.org/) is used to freeze module releases. For the versions available, see the tags on
this repository.

## Authors

* **Tarak Blah** - *Initial work*
* **Thomas Heil** - *Contributor*
