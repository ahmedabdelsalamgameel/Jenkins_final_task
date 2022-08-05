resource "aws_eip" "eip1" {
}

resource "aws_nat_gateway" "my_nat_gw1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_1.id
}
