# Common
variable "environment" {
  description = "Environment for the infrastructure"
  type = string
}

variable "region" {
  description = "Region name"
  type = string
}

variable "region_code" {
  description = "Region code for development"
  type = string
}

variable "prefix" {
  description = "Prefix for name of resource"
  type = string
}

variable "project" {
  description = "Name of project"
  type = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type = map(string)
  default = {}
}

# ECR
variable "create_private_ecr" {
  description = "Create private ecr repo"
  type        = bool
  default     = false
}

# S3
variable "create_private_bucket" {
  description = "Create private bucket"
  type        = bool
  default     = false
}

variable "s3_bucket_private_access_arn" {
  description = "ARN for apply policy s3 bucket resouce"
  type = string  
}