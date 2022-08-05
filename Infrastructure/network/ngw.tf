resource "aws_internet_gateway" "my_ngw" {
  vpc_id = aws_vpc.mainvpc.id
}