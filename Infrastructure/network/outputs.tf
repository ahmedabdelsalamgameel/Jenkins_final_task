output "vpc_id" {
  value = aws_vpc.mainvpc.id
}

output "pb1_sub_id" {
  value = aws_subnet.public_subnet_1.id
}
output "pb2_sub_id" {
  value = aws_subnet.public_subnet_2.id
}
output "pt1_sub_id" {
  value = aws_subnet.private_subnet_1.id
}
output "pt2_sub_id" {
  value = aws_subnet.private_subnet_2.id
}