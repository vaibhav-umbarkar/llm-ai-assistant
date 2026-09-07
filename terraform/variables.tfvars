region="ap-south-1" # Mumbai region
vpc_cidr_block = "10.0.0.0/16"
vpc_name = "LLM_AI_VPC"
author = "Vaibhav_Umbarkar"
public_availability_zones = [ 
    "ap-south-1a",
    "ap-south-1b"
]
private_availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
]

bastion_host_ami="ami-01a00762f46d584a1"
bastion_instance_type="t2.micro"
bastion_key_name="llm-bastion-key"

cluster_instance_ami="ami-01a00762f46d584a1"
cluster_instance_type="t3.micro"
cluster_instance_key_name="llm-cluster-key"