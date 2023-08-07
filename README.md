# IAM modules
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.ecr_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_access_key.s3_bucket_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.ecr_policy_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.ecr_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user.s3_bucket_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.s3_bucket_policy_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_iam_user_policy_attachment.user_ecr_policy_attach_private_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_bucket"></a> [create\_private\_bucket](#input\_create\_private\_bucket) | Create private bucket | `bool` | `false` | no |
| <a name="input_create_private_ecr"></a> [create\_private\_ecr](#input\_create\_private\_ecr) | Create private ecr repo | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the infrastructure | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for name of resource | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region name | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | Region code for development | `string` | n/a | yes |
| <a name="input_s3_bucket_private_access_arn"></a> [s3\_bucket\_private\_access\_arn](#input\_s3\_bucket\_private\_access\_arn) | ARN for apply policy s3 bucket resouce | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_private_access_key"></a> [ecr\_private\_access\_key](#output\_ecr\_private\_access\_key) | Private key to access ecr private |
| <a name="output_ecr_private_secret_key"></a> [ecr\_private\_secret\_key](#output\_ecr\_private\_secret\_key) | Secret key to access ecr private |
| <a name="output_s3_bucket_private_access_key"></a> [s3\_bucket\_private\_access\_key](#output\_s3\_bucket\_private\_access\_key) | Private key to access s3 bucket private |
| <a name="output_s3_bucket_private_secret_key"></a> [s3\_bucket\_private\_secret\_key](#output\_s3\_bucket\_private\_secret\_key) | Secret key to access s3 bucket private |
| <a name="output_user_ecr"></a> [user\_ecr](#output\_user\_ecr) | User to access ecr |
| <a name="output_user_s3"></a> [user\_s3](#output\_user\_s3) | User to access s3 |
<!-- END_TF_DOCS -->