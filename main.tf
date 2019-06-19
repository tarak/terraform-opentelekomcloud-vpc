module "vpc_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=master"
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  name       = "vpc"
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

module "subnet_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=master"
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  name       = "subnet"
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

resource "opentelekomcloud_vpc_v1" "this" {
  count = "${var.enabled == "true" ? 1 : 0}"
  cidr  = var.cidr
  name  = module.vpc_label.id
}

resource "opentelekomcloud_vpc_subnet_v1" "this" {
  count             = var.enabled && length(var.subnets) > 0 && (length(var.subnets) >= length(var.availability_zones)) ? length(var.subnets) : 0
  availability_zone = element(concat(var.availability_zones, [""]), count.index)
  cidr              = element(concat(var.subnets, [""]), count.index)
  gateway_ip        = element(concat(var.gateway_ips, [""]), count.index)
  name              = module.subnet_label.id
  vpc_id            = opentelekomcloud_vpc_v1.this.id
}
