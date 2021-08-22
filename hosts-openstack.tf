terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "/home/hailson.junior/.aws/credentials"
    profile = "Terraform"
}

resource "aws_instance" "controller" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.large"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
    
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
     
    tags = {
        Name = "Controller Node 1"
    }
}

resource "aws_instance" "compute" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.large"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
    
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
     
    tags = {
        Name = "Compute Node 1"
    }
}

resource "aws_instance" "block_storage_1" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.medium"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
    
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
     
    tags = {
        Name = "Block Storage Node 1"
    }
}

resource "aws_instance" "object_storage_1" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.medium"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
    
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
     
    tags = {
        Name = "Object Storage Node 1"
    }
}

resource "aws_instance" "object_storage_2" {
    ami = "ami-0cb5f8e033cfa84d2"
    instance_type = "t2.medium"
    key_name = "${aws_key_pair.key_openstack.key_name}"
    security_groups = ["Iac_group"]
    
    root_block_device {
        volume_size = 30
        volume_type = "gp2"
        delete_on_termination = true
    }
     
    tags = {
        Name = "Object Storage Node 2"
    }
}

resource "aws_key_pair" "key_openstack" {
    key_name = "key_openstack"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}"
}

## Descomente caso o security group não tenha sido criado
## Lembre-se que a máquina pela qual estamos criando os hosts do OpenStack, para acessaá-los, deve estar no mesmo security group
#
#resource "aws_security_group" "Iac_group" {
#    name = "Iac_group"
#    ingress {
#        from_port = 22
#        to_port = 22
#        protocol = "tcp"
#        cidr_blocks = ["172.31.93.181/32"]
#    }
#    egress {
#        from_port = 0
#        to_port = 0
#        protocol = -1
#        cidr_blocks = ["0.0.0.0/0"]
#    }
#}

output "private_ip" {
    value = [aws_instance.controller.private_ip,
            aws_instance.compute.private_ip,
            aws_instance.block_storage_1.private_ip,
            aws_instance.object_storage_1.private_ip,
            aws_instance.object_storage_2.private_ip]
}

output "public_dns_controller" {
    value = [aws_instance.controller.public_dns,
            aws_instance.compute.public_dns,
            aws_instance.block_storage_1.public_dns,
            aws_instance.object_storage_1.public_dns,
            aws_instance.object_storage_2.public_dns]
}