provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.tag_env
      Owner       = var.tag_owner
      Project     = var.tag_project
      Managed_by  = var.tag_managed
    }
  }
}
