
module "cloudvpc" {
  source = "./moduels/aws_vpc"

  name = var.cloud_vpc_name
  cidr = var.cloud_vpc_cidr

  azs = slice(data.aws_availability_zones.available.names,0,2) # Select first two aws availability zones
  public_subnets = slice(cidrsubnets(var.cloud_vpc_cidr,2,2,2,2),0,2)  # Caculate consecuitive CIDR range for public subnets
  private_subnets = slice(cidrsubnets(var.cloud_vpc_cidr,2,2,2,2),2,4) # Caculate consecuitive CIDR range for private subnets
#   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_vpn_gateway = true


}