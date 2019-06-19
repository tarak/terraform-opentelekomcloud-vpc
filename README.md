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
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes of the VPC label, e.g. `1`. | list | `[]` | no |
| convert\_case | Determines wether to convert all bucket label fields to lower case. | string | `"true"` | no |
| delimiter | Delimiter to be used between `organization`, `name`, `stage` and `attributes` bucket label fields. | string | `"-"` | no |
| enabled | Set to `"false"` to prevent the module from creating any resources. | string | `"true"` | no |
| namespace | The namespace or ID of the label, e.g. `example` or `Example Ltd.`. | string | n/a | **no** |
| stage | The stage or environment name of the bucket label, e.g. `prod`, `staging`, `dev`, or `test`. | string | n/a | **yes** |
| tags | Additional tags of the bucket label, e.g. `map("BusinessUnit","XYZ")`. | map | `{}` | no |

## Outputs

> Note: All outputs will be emtpy strings when `"enabled"` is set to `"false"`.

| Name | Description |
|------|-------------|

| id | Disambiguated ID of the module, based on the module label's `id`. |

## Versioning

[Semantic versioning](http://semver.org/) is used to freeze module releases. For the versions available, see the tags on
this repository.

## Authors

* **Tarak Blah** - *Initial work*
