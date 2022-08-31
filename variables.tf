variable "region" {
  default = "us-east-1"
  description = "Specify the region of the deployment"
}

variable "cloud_vpc_name" {
  default = "cloud_vpc"
  description = "Specify cloud side VPC name"
}

variable "cloud_vpc_cidr" {
  default = "10.0.100.0/24"
  description = "Specify cloud side VPC CIDR"
}

variable "onprem_vpc_name" {
    default = "onprem_vpc"
    description = "Specify on-prem VPC name"  
}

variable "onprem_vpc_cidr" {
    default = "10.0.200.0/24"
    description = "Specify on-prem VPC CIDR"  
}