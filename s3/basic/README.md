
# S3 module
 ---  
 Please go to [examples](/examples/)

## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.13.3 |
| aws | ~> 3.22.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | S3 bucket name | `string` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket | S3 bucket details |
