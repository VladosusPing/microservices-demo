terraform {
  backend "s3" {
    bucket       = "components-terraform-state"
    key          = "state/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
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

  ssh_pubkey_file  = var.ssh_pubkey_file
  tag_env          = var.tag_env
  ssh_privkey_file = var.ssh_privkey_file

}
