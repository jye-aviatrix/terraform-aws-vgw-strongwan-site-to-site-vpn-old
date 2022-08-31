# Cloud VPC
resource "aws_vpc" "cloud" {
  cidr_block = var.cloud_vpc_cidr
  tags = {
    Name = var.cloud_vpc_name
  }
}

# OnPrem VPC
resource "aws_vpc" "onprem" {
  cidr_block = var.onprem_vpc_cidr
  tags = {
    Name = var.onprem_vpc_name
  }
}