# This is main file for terraform on prod env
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.0"
    }
  }
}

module "aws_infrastructure" {
  source = "../modules/aws_infrastructure"

  ssh_pubkey_file            = var.ssh_pubkey_file
  tag_env                    = var.tag_env
  ssh_privkey_file           = var.ssh_privkey_file

}