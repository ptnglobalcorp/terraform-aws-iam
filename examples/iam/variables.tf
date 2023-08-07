variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "region_code" {
  type = string
}

variable "prefix" {
  type = string
}

variable "project" {
  type = string
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