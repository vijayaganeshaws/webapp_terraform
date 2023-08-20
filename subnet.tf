##Public and Private Subnets 
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.webapp-poc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.webapp-poc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}

## Internet gateway for VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.webapp-poc.id

  tags = {
    Name = "Webapp VPC IG"
  }
}

##Route table for VPC
resource "aws_route_table" "second_rt" {
  vpc_id = aws_vpc.webapp-poc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "2nd Route Table"
  }
}

##Subnet association for VPC
resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.second_rt.id
}
