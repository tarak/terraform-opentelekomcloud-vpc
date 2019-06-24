module "nat_gateway_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=master"
  count      = var.enabled && var.nat_gateway_enabled ? 1 : 0
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  name       = "natgw"
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

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
  nat_gateway_id = opentelekomcloud_nat_gateway_v2.this.id
  network_id     = opentelekomcloud_vpc_subnet_v1.this.0.id
  floating_ip_id = opentelekomcloud_networking_floatingip_v2.this.id
}
