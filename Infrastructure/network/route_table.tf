resource "aws_route_table" "public_route1" {
  vpc_id = aws_vpc.mainvpc.id
}

resource "aws_route" "rt_public" {
  route_table_id = aws_route_table.public_route1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.my_ngw.id
}

resource "aws_route_table_association" "association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route1.id
}
resource "aws_route_table_association" "association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route1.id
}


###########################################################

resource "aws_route_table" "private_route1" {
  vpc_id = aws_vpc.mainvpc.id
}

resource "aws_route" "rt_private" {
  route_table_id = aws_route_table.private_route1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.my_nat_gw1.id
}
resource "aws_route_table_association" "association_3" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route1.id
}
resource "aws_route_table_association" "association_4" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route1.id
}