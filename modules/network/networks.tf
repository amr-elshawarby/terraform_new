# vpc_module.tf

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_ip
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet_cidr_blocks
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.private_subnet_cidr_blocks
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet"
  }
}

output "public" {
  value       = aws_subnet.public_subnets.id
  description = "The IDs of the created public subnets"
}
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id


  tags = {
    Name = "igw"
  }
}
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "amr_table"
  }
}

# Association 
resource "aws_route_table_association" "my_table" {
    subnet_id = aws_subnet.public_subnets.id
    route_table_id = aws_route_table.public_route.id
}
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

