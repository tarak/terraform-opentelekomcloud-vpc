output "nat_gateway_floating_ip_address" {
  value = var.enabled && var.nat_gateway_enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}

output "nat_gateway_floating_ip_id" {
  value = var.enabled && var.nat_gateway_enabled ? opentelekomcloud_nat_snat_rule_v2.this.*.floating_ip_id : [""]
}

output "subnets_subnet_ids" {
  description = "List of IDs of subnets"
  value       = var.enabled ? opentelekomcloud_vpc_subnet_v1.this.*.subnet_id : [""]
}

output "subnet_ids" {
  description = "List of v2 IDs of subnets"
  value       = var.enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = var.enabled ? concat(opentelekomcloud_vpc_v1.this.*.id, [""])[0] : ""
}
