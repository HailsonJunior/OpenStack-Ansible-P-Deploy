variable "ami" {
    type = string
    description = "AMI"
    default = "ami-0cb5f8e033cfa84d2"
}

variable "block_size" {
    type = number
    description = "Storage block size"
    default = 10
}

variable "block_type" {
    type = string
    description = "Block type"
    default = "gp2"
}

variable "subnetid" {
    type = string
    description = "Subnet id"
    default = "subnet-3a5ad31b"
}
