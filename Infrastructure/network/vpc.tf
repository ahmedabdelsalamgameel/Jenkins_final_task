resource "aws_vpc" "mainvpc" {
  cidr_block = var.m_vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main-vpc"
  }
}