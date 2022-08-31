# Cloud VPC
resource "aws_vpc" "cloud" {
  cidr_block = var.cloud_vpc_cidr
  tags = {
    Name = var.cloud_vpc_name
  }
}

# Cloud VPC IGW
resource "aws_internet_gateway" "cloud" {
  vpc_id = aws_vpc.cloud.id

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

# OnPrem VPC IGW
resource "aws_internet_gateway" "onprem" {
  vpc_id = aws_vpc.onprem.id

  tags = {
    Name = var.onprem_vpc_name
  }
}

