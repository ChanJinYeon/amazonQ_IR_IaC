# ===========================================
# VPC basic info
# ===========================================
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "VPC CIDR block"
  value       = aws_vpc.main.cidr_block
}

# ===========================================
# Subnet info
# ===========================================
output "subnet_ids" {
  description = "All subnet IDs"
  value       = aws_subnet.main[*].id
}

output "subnet_cidrs" {
  description = "All subnet CIDRs"
  value       = aws_subnet.main[*].cidr_block
}

# ===========================================
# Default Route Table info
# ===========================================
output "default_route_table_id" {
  description = "Default Route Table ID"
  value       = aws_default_route_table.default.id
}

# ===========================================
# Internet Gateway info
# ===========================================
output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.main.id
}

# ===========================================
# Security group info
# ===========================================
output "default_security_group_id" {
  description = "Default Security Group ID"
  value       = aws_vpc.main.default_security_group_id
}

output "default_network_acl_id" {
  description = "Default Network ACL ID"
  value       = aws_vpc.main.default_network_acl_id
}