data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  subnet_id                   = module.network.pb1_sub_id
  key_name                    = aws_key_pair.generated_key.id

  tags = {
    Name = "bastion_ec2"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
}
resource "aws_instance" "application" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  subnet_id              = module.network.pt1_sub_id
  key_name               = aws_key_pair.generated_key.id

  tags = {
    Name = "application_ec2"
  }

}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "test_keypair"
  public_key = tls_private_key.my_key.public_key_openssh
}