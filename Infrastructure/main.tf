module "network" {
  source        = "./network"
  reg           = var.region
  m_vpc_cidr    = var.vpc_cidr
  pc_sub_1_cidr = var.public_subnet_1_cidr
  pc_sub_2_cidr = var.public_subnet_2_cidr
  pt_sub_1_cidr = var.private_subnet_1_cidr
  pt_sub_2_cidr = var.private_subnet_2_cidr
  inst_type     = var.instance_type
}