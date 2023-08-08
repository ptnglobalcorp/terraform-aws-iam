# S3 
output "user_s3" {
  description = "User to access s3"
  value = try(aws_iam_user.s3_bucket_private_access[0], "")
}

output "s3_bucket_private_access_key" {
  description = "Private key to access s3 bucket private"
  value = try(aws_iam_access_key.s3_bucket_private_access[0].id, "")
}

output "s3_bucket_private_secret_key" {
  description = "Secret key to access s3 bucket private"
  value = try(aws_iam_access_key.s3_bucket_private_access[0].secret, "")
}  

# ECR 
output "user_ecr" {
  description = "User to access ecr"
  value = try(aws_iam_user.ecr_private_access[0], "")
}

output "ecr_private_access_key" {
  description = "Private key to access ecr private"
  value = try(aws_iam_access_key.ecr_private_access[0].id, "")
}

output "ecr_private_secret_key" {
  description = "Secret key to access ecr private"
  value = try(aws_iam_access_key.ecr_private_access[0].secret, "")
}  