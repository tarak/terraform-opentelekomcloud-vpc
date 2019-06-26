# terraform-opentelekomcloud-vpc

Terraform module which creates VPC resources on Open Telekom Cloud (OTC).

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/opentelekomcloud/r/vpc_v1.html)
* [Subnet](https://www.terraform.io/docs/providers/opentelekomcloud/r/vpc_subnet_v1.html)
* [NAT Gateway](https://www.terraform.io/docs/providers/opentelekomcloud/r/nat_gateway_v2.html)
* [SNAT Rule](https://www.terraform.io/docs/providers/opentelekomcloud/r/nat_snat_rule_v2.html)
* [Floating IP](https://www.terraform.io/docs/providers/opentelekomcloud/r/networking_floatingip_v2.html)

This module uses the `terraform-terraform-label` to implement a strict naming convention. For more information see:

- [terraform-terraform-label](https://github.com/cloudposse/terraform-terraform-label)

## Terraform versions

This module supports Terraform 0.12 and newer.

## Usage

```
module "vpc" {
  source             = "tarak/vpc/opentelekomcloud"
  availability_zones = ["eu-de-01", "eu-de-02", "eu-de-03"]
  cidr               = "10.0.0.0/12"
  gateway_ips        = ["10.0.0.1", "10.4.0.1", "10.8.0.1"]
  namespace          = "acme"
  stage              = "prod"
  subnets            = ["10.0.0.0/16", "10.4.0.0/16", "10.8.0.0/16"]

  subnets_dns_list = [
    ["100.125.4.25", "8.8.8.8"],
    ["100.125.4.25", "8.8.8.8"],
    ["100.125.4.25", "8.8.8.8"]
  ]
}

```

## Examples

* [Simple VPC](https://github.com/tarak/terraform-opentelekomcloud-vpc/tree/master/examples/simple-vpc)
* [Complete VPC](https://github.com/tarak/terraform-opentelekomcloud-vpc/tree/master/examples/complete-vpc)
* [DNS Servers](https://github.com/tarak/terraform-opentelekomcloud-vpc/tree/master/examples/vpc-dns)
* [Asymetric Availability Zones](https://github.com/tarak/terraform-opentelekomcloud-vpc/tree/master/examples/asymetric)
* [No Availability Zones](https://github.com/tarak/terraform-opentelekomcloud-vpc/tree/master/examples/no-azs)

## Authors

* **Tarak Blah** - *Initial work*
* **Thomas Heil** - *Contributor*
