
variable "vpc_ip" {
  type        = string
  description = "The CIDR block for the VPC"
}
variable "public_subnet_cidr_blocks" {
  type        = string
  description = "CIDR blocks for public subnets"
}
variable "private_subnet_cidr_blocks" {
  type        = string
  description = "CIDR blocks for private subnets"
}
