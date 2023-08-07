locals {
  tags = {
    Project = var.project
    Environment = var.environment
  }
}

module "s3" {
  source = "ptnglobalcorp/s3/aws"
    
  region = var.region
  region_code = var.region_code
  project = local.tags.Project
  environment = local.tags.Environment

  create_private_bucket = var.create_private_bucket
  force_destroy = var.force_destroy  
  
  tags = local.tags
}

module "iam_user" {
  source = "ptnglobalcorp/iam/aws"

  region = var.region
  region_code = var.region_code
  project = local.tags.Project
  environment = local.tags.Environment  

  s3_bucket_private_access_arn = module.s3.s3_bucket_private_arn
  create_private_bucket = var.create_private_bucket
  create_private_ecr = var.create_private_ecr

  tags = local.tags
}




