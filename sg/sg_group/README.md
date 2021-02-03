
# Security group module

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
| description | n/a | `string` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| group\_name | n/a | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | Security group ID |
