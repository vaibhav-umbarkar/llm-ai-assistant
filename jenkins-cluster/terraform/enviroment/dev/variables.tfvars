region="ap-south-1"
author="Vaibhav Umbarkar"
vpc_cidr_block="10.0.0.0/16"
vpc_name="jenkins-cluster-vpc"
public_subnets_count=2
private_subnets_count=2
availability_zones = [ 
    "ap-south-1a",
    "ap-south-1b"
]

bastion_ami="" # Bastion-Host AMI
bastion_instance_type = "" # Bastion-Host Instance Type
bastion_key_name="bastion-host-key" # Bastion_Host .pem Key Name

jenkins_controller_ami = "" # Jenkins Controller AMI
jenkins_controller_instance_type = "" # Jenkins Controller Instance Type
jenkins_controller_key_name = "jenkins-controller-key" # Jenkins Controller .pem Key Name
