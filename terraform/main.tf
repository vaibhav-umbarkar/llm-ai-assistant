module "vpc" {
    source = "./modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    author = var.author
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    public_availability_zones = var.public_availability_zones
    private_availability_zones = var.private_availability_zones
    author = var.author
}

module "igw" {
    source = "./modules/igw"
    vpc_id = module.vpc.vpc_id
    author = var.author
}

module "nat" {
    source = "./modules/nat"
    public_subnet_ids = module.subnets.public_subnet_ids
    author = var.author

}

module "route-tb" {
    source = "./modules/route-tb"
    vpc_id = module.vpc.vpc_id
    igw_id = module.igw.igw_id
    nat_id = module.nat.nat_id
    public_subnet_ids = module.subnets.public_subnet_ids
    private_subnet_ids = module.subnets.private_subnet_ids
    author = var.author
    
}

module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
    author = var.author
}

module "bastion-host" {
    source = "./modules/bastion-host"
    bastion_host_ami = var.bastion_host_ami
    bastion_instance_type = var.bastion_instance_type
    bastion_key_name = var.bastion_key_name
    bastion_sg_id = module.sg.bastion-sg-id
    public_subnet_ids = module.subnets.public_subnet_ids
    author = var.author
}

module "cluster-instance" {
    source = "./modules/cluster-instance"
    private_subnet_ids = module.subnets.private_subnet_ids
    cluster_instance_ami = var.cluster_instance_ami
    cluster_instance_type = var.cluster_instance_type
    cluster_instance_key_name = var.cluster_instance_key_name
    cluster_instance_sg_id = module.sg.cluster_sg_id
    author = var.author
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    alb_sg_id = module.sg.alb_sg_id
    public_subnet_ids = module.subnets.public_subnet_ids
    cluster_instance_id = module.cluster-instance.cluster_instance_id
    author = var.author
}