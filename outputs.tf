output "vpc_id" {
  value = var.enabled ? concat(opentelekomcloud_vpc_v1.this.*.id, [""])[0] : ""
}

output "nat_gateway_floating_ip_address" {
  value = var.enabled && var.nat_gateway_enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}

output "nat_gateway_floating_ip_id" {
  value = var.enabled && var.nat_gateway_enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}

output "subnets_subnet_ids" {
  value = var.enabled ? opentelekomcloud_vpc_subnet_v1.this.*.subnet_id : [""]
}

output "subnet_ids" {
  value = var.enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}
