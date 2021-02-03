
# Subnet module supporting multiple subnets

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
| availability\_zones | Availability zones in scope | `list(string)` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| map\_public\_ip | Enable public IP | `bool` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| subnet\_cidr\_blocks | Subnet CIDR blocks | `list(string)` | n/a | yes |
| subnet\_suffix | Suffix to append to subnets name | `string` | n/a | yes |
| subnet\_tags | Additional tags for the subnets | `map(string)` | `{}` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | Custom VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets\_ids | IDs for subnets |
