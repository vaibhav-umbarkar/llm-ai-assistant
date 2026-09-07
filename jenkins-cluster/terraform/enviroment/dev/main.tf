module "vpc" {
    source = "../../modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    vpc_name = var.vpc_name
    author = var.author
}

module "subnets" {
    source = "../../modules/subnets"
    vpc_id = module.vpc.vpc_id
    availability_zones = var.availability_zones
    author = var.author
}

module "igw" {
    source = "../../modules/ig"
    vpc_id = module.vpc.vpc_id
    author = var.author
}

module "nat" {
    source = "../../modules/nat"
    author = var.author
    public_subnet_ids = module.subnets.public_subnet_ids
}

module "rt" {
    source = "../../modules/route-table"
    vpc_id = module.vpc.vpc_id
    igw_id = module.igw.igw_id
    nat_id = module.nat.nat_id
    public_subnet_ids = module.subnets.public_subnet_ids
    private_subnet_ids = module.subnets.private_subnet_ids
    author = var.author
}

module "security_groups" {
    source = "../../modules/security-groups"
    vpc_id = module.vpc.vpc_id
    author = var.author
}

module "jenkins_controller" {
    source = "../../modules/jenkins-controller"
    private_subnet_ids = module.subnets.private_subnet_ids
    jenkins_controller_sg_id = module.security_groups.jenkins_controller_sg_id
    jenkins_controller_ami = var.jenkins_controller_ami
    jenkins_controller_instance_type = var.jenkins_controller_instance_type
    jenkins_controller_key_name = var.jenkins_controller_key_name
    author = var.author
}

module "jenkins_lb" {
    source = "../../modules/lb"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.subnets.public_subnet_ids
    alb_sg_id = module.security_groups.alb_sg_id
    jenkins_controller_id = module.jenkins_controller.jenkins_controller_id
    author = var.author
}

module "bastion_host" {
    source = "../../modules/bastion"
    bastion_ami = var.bastion_ami
    bastion_instance_type = var.bastion_instance_type
    bastion_key_name = var.bastion_key_name
    bastion_sg_id = module.security_groups.bastion_sg_id
    public_subnet_ids = module.subnets.public_subnet_ids
    author = var.author
}
