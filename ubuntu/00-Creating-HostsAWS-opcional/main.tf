terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"

    # Após criar o bucket s3, descomente o módulo abaixo para criar buckup do state
    # Ajuste o profile
    
    #backend "s3" {
    #    bucket = "openstackbucket"
    #    key = "instances-openstack-state/terraform.tfstate"
    #    region = "us-east-1"
    #    profile = "Terraform"  
    #}
}

# Utilize variáveis de ambiente para key id e secret key da AWS ou descomente a linha "shared_credentials_file" informando o caminho do arquivo com as credenciais
#
provider "aws" {
    region = var.aws_region
#    shared_credentials_file = var.aws_credential
    profile = var.aws_profile
}

# Descomente caso seja necessário criar um security group
# module "security_group" {
#    source = "./security_group"
#}

module "s3" {
    source = "./s3"
}

module "instances" {
    source = "./instances"
}

module "vpc" {
    source = "./vpc"
}