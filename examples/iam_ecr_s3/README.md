# IAM module
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user"></a> [iam\_user](#module\_iam\_user) | ptnglobalcorp/iam/aws | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ptnglobalcorp/s3/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_bucket"></a> [create\_private\_bucket](#input\_create\_private\_bucket) | Create private bucket | `bool` | `true` | no |
| <a name="input_create_private_ecr"></a> [create\_private\_ecr](#input\_create\_private\_ecr) | Create private repo ecr | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the infrastructure | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Destroy the bucket without emptying | `bool` | `false` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for name of resource | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region name | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | Region code for development | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->