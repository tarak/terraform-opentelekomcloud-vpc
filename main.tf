#################
# Naming labels
#################

module "nat_gateway_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=master"
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  name       = "natgw"
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

######
# VPC
######

resource "opentelekomcloud_vpc_v1" "this" {
  count = var.enabled ? 1 : 0
  cidr  = var.cidr
  name  = module.vpc_label.id
}


##########
# Subnets
##########

resource "opentelekomcloud_vpc_subnet_v1" "this" {
  count             = var.enabled && length(var.subnets) > 0 && length(var.subnets) >= length(var.availability_zones) ? length(var.subnets) : 0
  availability_zone = element(var.availability_zones, count.index)
  cidr              = element(concat(var.subnets, [""]), count.index)
  dhcp_enable       = element(concat(var.subnets_dhcp_enable, [true]), count.index)
  dns_list          = length(var.subnets_dns_list) == length(var.subnets) ? element(var.subnets_dns_list, count.index) : []
  gateway_ip        = element(concat(var.gateway_ips, [""]), count.index)
  name              = join(var.delimiter, [module.subnet_label.id, format("%02s", count.index + 1)])
  primary_dns       = element(concat(var.subnets_primary_dns, [null]), count.index)
  secondary_dns     = element(concat(var.subnets_secondary_dns, [null]), count.index)
  vpc_id            = opentelekomcloud_vpc_v1.this.0.id
}

##############
# NAT Gateway
##############

resource "opentelekomcloud_nat_gateway_v2" "this" {
  count               = var.enabled && var.nat_gateway_enabled ? 1 : 0
  name                = module.nat_gateway_label.id
  spec                = var.nat_gateway_spec
  router_id           = opentelekomcloud_vpc_v1.this.0.id
  internal_network_id = opentelekomcloud_vpc_subnet_v1.this.0.id
}

resource "opentelekomcloud_networking_floatingip_v2" "this" {
  count = var.enabled && var.nat_gateway_enabled ? 1 : 0
  pool  = var.nat_gateway_pool
}

resource "opentelekomcloud_nat_snat_rule_v2" "this" {
  count          = var.enabled && var.nat_gateway_enabled ? 1 : 0
  nat_gateway_id = opentelekomcloud_nat_gateway_v2.this.0.id
  network_id     = opentelekomcloud_vpc_subnet_v1.this.0.id
  floating_ip_id = opentelekomcloud_networking_floatingip_v2.this.0.id
}
