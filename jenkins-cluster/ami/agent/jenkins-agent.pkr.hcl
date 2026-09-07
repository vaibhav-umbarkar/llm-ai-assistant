packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "jenkins-agent" {
  ami_name      = "jenkins-agent-ami" # Agent AMI Name
  region        = "ap-south-1" # Region where agent want to be created
  ssh_username  = "ubuntu" # Username
  instance_type = "" # Instance type for temp instance
  source_ami    = "" # Source AMI
  vpc_id        = "" # Existing VPC ID
  subnet_id     = "" # Existing Subnet ID
}

build {
  name    = "jenkins-agent-ami-build"
  sources = ["source.amazon-ebs.jenkins-agent"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install -y openjdk-21-jdk",
      "sudo apt install -y git curl unzip",
      "sudo apt install -y docker.io",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo usermod -aG docker ubuntu",
      "sudo mkdir -p /home/ubuntu/jenkins",
      "sudo chown -R ubuntu:ubuntu /home/ubuntu/jenkins",
      "sudo apt clean"
    ]
  }
}
