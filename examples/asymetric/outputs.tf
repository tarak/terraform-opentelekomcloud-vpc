output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "List of IDs of subnets"
  value       = module.vpc.subnet_ids
}
