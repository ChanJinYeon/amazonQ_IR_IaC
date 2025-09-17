# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true   # vpc 내에서 DNS 해석
  enable_dns_support   = true   # EC2 instance에 DNS hostname 할당

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Subnet
resource "aws_subnet" "main" {
  count = length(var.subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zone[count.index]
  
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project_name}-subnet-${count.index + 1}"
    Type = "Hybrid"  # Public/Private 둘 다 가능
  }
}

# Route Table
resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "main" {
  count = length(var.subnet_cidrs)

  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_default_route_table.default.id
}