resource "aws_security_group" "openstack-sg" {
    name = "openstack-sg"
    ingress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["172.31.0.0/16"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_network_interface" "network-controller" {
    subnet_id = var.subnetid
    private_ips = ["172.31.83.5"]
    security_groups = [aws_security_group.openstack-sg.id]

    tags = {
        Name = "primary_network_interface"
    }
}

resource "aws_network_interface" "network-compute" {
    subnet_id = var.subnetid
    private_ips = ["172.31.83.6"]
    security_groups = [aws_security_group.openstack-sg.id]

    tags = {
        Name = "primary_network_interface"
    }
}

resource "aws_network_interface" "network-block" {
    subnet_id = var.subnetid
    private_ips = ["172.31.83.7"]
    security_groups = [aws_security_group.openstack-sg.id]

    tags = {
        Name = "primary_network_interface"
    }
}

resource "aws_network_interface" "network-object" {
    subnet_id = var.subnetid
    private_ips = ["172.31.83.8"]
    security_groups = [aws_security_group.openstack-sg.id]

    tags = {
        Name = "primary_network_interface"
    }
}