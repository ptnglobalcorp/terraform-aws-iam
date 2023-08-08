# common
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


# s3
variable "create_private_bucket" {
  description = "Create private bucket"
  type = bool
  default = true
}

variable "force_destroy" {
  description = "Destroy the bucket without emptying"
  type = bool
  default = false
}

#ecr 
variable "create_private_ecr" {
  description = "Create private repo ecr"
  type = bool
  default = true
}

