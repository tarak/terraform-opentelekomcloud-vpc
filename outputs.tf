output "vpc_id" {
  description = "The ID of the VPC"
  value       = var.enabled ? concat(opentelekomcloud_vpc_v1.this.*.id, [""])[0] : ""
}

output "subnet_ids" {
  description = "List of IDs of subnets"
  value       = var.enabled ? opentelekomcloud_vpc_subnet_v1.this.*.id : [""]
}
