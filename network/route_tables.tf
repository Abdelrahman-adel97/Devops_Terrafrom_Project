## route tables--------------------------------------------
resource "aws_route_table" "Public-table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "devops-pub-rt"
  }
}
resource "aws_route_table_association" "pub-a" {
  subnet_id      = aws_subnet.public-sub-1.id
  route_table_id = aws_route_table.Public-table.id
}

resource "aws_route_table_association" "pub-b" {
  subnet_id      = aws_subnet.public-sub-2.id
  route_table_id = aws_route_table.Public-table.id
}
resource "aws_route_table" "Private-table" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "devops-priv-rt"
  }
  depends_on = [aws_nat_gateway.nat-gw]
}
resource "aws_route_table_association" "priv-a" {
  subnet_id      = aws_subnet.private-sub-1.id
  route_table_id = aws_route_table.Private-table.id
}

resource "aws_route_table_association" "priv-b" {
  subnet_id      = aws_subnet.private-sub-2.id
  route_table_id = aws_route_table.Private-table.id
}
