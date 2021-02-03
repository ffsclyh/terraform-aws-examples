
# Resource: aws\_vpc  
Create custom VPC using aws\_vpc resource

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
| cidr\_block | VPC CIDR block | `string` | n/a | yes |
| enable\_classiclink | Classic link: should be disabled | `bool` | n/a | yes |
| enable\_dns\_hostnames | Enable DNS for hostnames | `bool` | n/a | yes |
| enable\_dns\_support | Enable DNS support | `bool` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| instance\_tenancy | Instance tenancy. default: default | `string` | n/a | yes |
| name | Name of the custom VPC | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_tags | Additional tags for the VPC | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | Custom VPC id |
