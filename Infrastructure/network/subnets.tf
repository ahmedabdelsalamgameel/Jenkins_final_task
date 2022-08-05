resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.mainvpc.id
  availability_zone = "${var.reg}a"
  cidr_block = var.pc_sub_1_cidr
  map_public_ip_on_launch="true"
  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.mainvpc.id
  availability_zone = "${var.reg}b"
  cidr_block = var.pc_sub_2_cidr
  map_public_ip_on_launch="true"
  tags = {
    Name = "public-subnet-2"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.mainvpc.id
  availability_zone = "${var.reg}a"
  cidr_block = var.pt_sub_1_cidr
  tags = {
    Name = "private-subnet-1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.mainvpc.id
  availability_zone = "${var.reg}b"
  cidr_block = var.pt_sub_2_cidr
  tags = {
    Name = "private-subnet-2"
  }
}

