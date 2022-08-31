
module "cloudvpc" {
  source = "./moduels/aws_vpc"

  name = var.cloud_vpc_name
  cidr = var.cloud_vpc_cidr

  azs                = slice(data.aws_availability_zones.available.names, 0, 2) # Select first two aws availability zones
  public_subnets     = slice(cidrsubnets(var.cloud_vpc_cidr, 2, 2, 2, 2), 0, 2) # Caculate consecuitive CIDR range for public subnets
  private_subnets    = slice(cidrsubnets(var.cloud_vpc_cidr, 2, 2, 2, 2), 2, 4) # Caculate consecuitive CIDR range for private subnets
  enable_vpn_gateway = true
  remote_vpc_cidr    = var.onprem_vpc_cidr

}



module "onpremvpc" {
  source = "./moduels/aws_vpc"

  name = var.onprem_vpc_name
  cidr = var.onprem_vpc_cidr

  azs                = slice(data.aws_availability_zones.available.names, 0, 2) # Select first two aws availability zones
  public_subnets     = slice(cidrsubnets(var.onprem_vpc_cidr, 2, 2, 2, 2), 0, 2) # Caculate consecuitive CIDR range for public subnets
  private_subnets    = slice(cidrsubnets(var.onprem_vpc_cidr, 2, 2, 2, 2), 2, 4) # Caculate consecuitive CIDR range for private subnets
  enable_vpn_gateway = false
  

}

# Create EIP for OnPrem VPN Gateway
resource "aws_eip" "onpremvpngw" {
  vpc = true
}


# Create customer gateway
resource "aws_customer_gateway" "main" {
  bgp_asn    = var.onprem_asn
  ip_address = aws_eip.onpremvpngw.public_ip
  type       = "ipsec.1"

  tags = {
    Name = var.onprem_vpn_gw_name
  }
}