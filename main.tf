locals {
  prefix = var.prefix
  project = var.project
  environment = var.environment
  region_code = var.region_code
  create_private_bucket = var.create_private_bucket
  create_private_ecr = var.create_private_ecr
}

#---------------------------------------------------- S3 ----------------------------------------------------

# IAM User for accessing private S3 bucket
resource "aws_iam_user" "s3_bucket_private_access" {
  count = local.create_private_bucket ? 1 : 0
  name = "${local.prefix}-${local.project}-${local.environment}-iam-${local.region_code}-bucket" # Define name of aws iam user

  tags = merge(var.tags, {
    ApplicationRole = "AWS User for access private S3 Bucket"
  })
}           

# IAM Access Key for the above IAM user to access S3 bucket
resource "aws_iam_access_key" "s3_bucket_private_access" {
  count = local.create_private_bucket ? 1 : 0
  user = aws_iam_user.s3_bucket_private_access[count.index].name # create access key for s3 private bucket access
}

# User policy for access private bucket
resource "aws_iam_user_policy" "s3_bucket_policy_private_access" {
  count = local.create_private_bucket ? 1 : 0
  name = "${local.prefix}-${local.project}-${local.environment}-iam-policy-${local.region_code}-bucket" # define name of iam user policy
  user = aws_iam_user.s3_bucket_private_access[count.index].name # pass the user of iam user private bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [  
      {
        Sid    = "VisualEditor0"
        Effect = "Allow"
        Action = [
          "s3:ListBucketMultipartUploads",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = ["${var.s3_bucket_private_access_arn}"] # Pass the resource attach to policy
      },
      {
        Sid    = "VisualEditor1"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:AbortMultipartUpload",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging",
          "s3:DeleteObject",
          "s3:ListMultipartUploadParts"
        ]
        Resource = ["${var.s3_bucket_private_access_arn}/*"] # Pass the resource attach to policy
      }, 
    ]
  })
}

#---------------------------------------------------- ECR ----------------------------------------------------

# IAM User for accessing private ECR repos
resource "aws_iam_user" "ecr_private_access" {
  count = local.create_private_ecr ? 1 : 0
  
  name = "${local.prefix}-${local.project}-${local.environment}-iam-${local.region_code}-repo" # Define name of aws iam user
  
  tags = merge(var.tags, {
    ApplicationRole = "AWS User for access private ECR repo"
  })
}

# IAM Access Key for the above IAM user to access ECR repo
resource "aws_iam_access_key" "ecr_private_access" {
  count = local.create_private_ecr ? 1 : 0
  user = aws_iam_user.ecr_private_access[count.index].name
}

# User policy for access private repo
resource "aws_iam_policy" "ecr_policy_private_access" {
  count = local.create_private_ecr ? 1 : 0
  name = "ecr_policy_private"
  description = "ECR access policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:DescribeImageScanFindings",
          "ecr:DescribeImages",
          "ecr:DescribeRepositories",
          "ecr:GetAuthorizationToken",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:GetRepositoryPolicy",
          "ecr:ListImages",
          "ecr:ListTagsForResource"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# Attach policy for user ECR repo
resource "aws_iam_user_policy_attachment" "user_ecr_policy_attach_private_access" {
  count = local.create_private_ecr ? 1 : 0
  user = aws_iam_user.ecr_private_access[count.index].name
  policy_arn = aws_iam_policy.ecr_policy_private_access[count.index].arn
}

#---------------------------------------------------- NONE ----------------------------------------------------