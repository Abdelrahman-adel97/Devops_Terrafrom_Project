## route tables--------------------------------------------
resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "devops-pub-rt"
  }
}
resource "aws_route_table" "dev-private-rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "devops-priv-rt"
  }
}

## route_table_assoc--------------------------------------------

resource "aws_route_table_association" "pub-a" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.dev-public-rt.id
}

resource "aws_route_table_association" "pub-b" {
  subnet_id      = aws_subnet.public-sub-2.id
  route_table_id = aws_route_table.dev-public-rt.id
}

resource "aws_route_table_association" "priv-a" {
  subnet_id      = aws_subnet.private-sub-1.id
  route_table_id = aws_route_table.dev-private-rt.id
}

resource "aws_route_table_association" "priv-b" {
  subnet_id      = aws_subnet.private-sub-2.id
  route_table_id = aws_route_table.dev-private-rt.id
}
