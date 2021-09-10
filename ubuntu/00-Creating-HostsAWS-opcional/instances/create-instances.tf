resource "aws_vpc" "openstack-vpc" {
    cidr_block = "10.0.0.0/24"

    tags = {
        Name = "openstack-vpc"
    }  
}

resource "aws_subnet" "openstack-subnet" {
    vpc_id = aws_vpc.openstack-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"  

    tags = {
      "Name" = "openstack-subnet"
    }
}

resource "aws_network_interface" "controller-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.11" ]
    security_groups = ["${aws_security_group.openstack_group.name}"]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "compute-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.31" ]
    security_groups = ["${aws_security_group.openstack_group.name}"]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "block1-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.41" ]
    security_groups = ["${aws_security_group.openstack_group.name}"]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "object1-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.51" ]
    security_groups = ["${aws_security_group.openstack_group.name}"]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_network_interface" "object2-network" {
    subnet_id = aws_subnet.openstack-subnet.id
    private_ips = [ "10.0.0.52" ]
    security_groups = ["${aws_security_group.openstack_group.name}"]

    tags = {
      "Name" = "primary_network_interface"
    }
}

resource "aws_instance" "controller" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = var.key_pair

    network_interface {
      network_interface_id = aws_network_interface.controller-network.id
      device_index = 0
    }

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "controller"
    }
}

resource "aws_instance" "compute" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = var.key_pair

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "compute"
    }
}

resource "aws_instance" "block1" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = var.key_pair

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "block 1"
    }
}

resource "aws_instance" "object1" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = var.key_pair

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "object 1"
    }
}

resource "aws_instance" "object2" {
    instance_type = "t2.micro"
    ami = var.ami
    key_name = var.key_pair

    root_block_device {
        volume_size = var.block_size
        volume_type = var.block_type
        delete_on_termination = true
    }

    tags = {
        Projeto = "OpenStack"
        Name = "object 2"
    }
}