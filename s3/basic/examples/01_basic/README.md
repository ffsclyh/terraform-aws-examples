
# S3 demo
 ---

 ## Usage:

`terraform init`
`terraform plan`
`terraform apply`

## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.13.3 |
| aws | ~> 3.22.0 |
| random | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| random | 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| region | Region name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_details | n/a |
