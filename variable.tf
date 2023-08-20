variable "ami" {
    type        = map(string)

    default = {
        "eu-west-2" = "ami-0f3d9639a5674d559"
        "ap-sout-1" = "ami-0da59f1af71ea4ad2"
        "ap-souteast-2" = "ami-0a709bebf4fa9246f"
    }
}

variable "instance_count" {
    default = "3"
}

variable "instance_type" {
    default = "t2.micro"
}
variable "aws_region" {
    default = "eu-west-2"
}
variable "key_name" {
    default = "test1"
}
variable "zones"{
  default = "a,b,c"
}
variable "security_group_name" {
    default = "webapp-poc"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}