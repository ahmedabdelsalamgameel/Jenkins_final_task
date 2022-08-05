resource "aws_db_instance" "mysql_instance" {

  identifier                  = "mysqldb"
  allocated_storage           = 10
  engine                      = "mysql"
  engine_version              = "8.0.28"
  instance_class              = "db.t2.micro"
  db_name                     = "mydb"
  username                    = "admin"
  password                    = "10321032"
  skip_final_snapshot         = true
  availability_zone           = "${var.region}a"
  allow_major_version_upgrade = true
  db_subnet_group_name        = aws_db_subnet_group.mysql-subnet-group.name
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
}
resource "aws_db_subnet_group" "mysql-subnet-group" {
  name       = "mysql-subnet-group"
  subnet_ids = [module.network.pt1_sub_id, module.network.pt2_sub_id]
}