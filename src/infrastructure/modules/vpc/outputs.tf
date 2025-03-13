output "vpc_id" {
  description = "The Id of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "The name of the VPC."
  value       = module.vpc.name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "A list of private subnets."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "A list of public subnets."
  value       = module.vpc.public_subnets
}