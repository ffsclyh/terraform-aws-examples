
# Routing module

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
| destination\_cidr\_block | Destination CIDR for ingress | `string` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| subnets | Subnets to be associated with the route table | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | Custom VPC id | `string` | n/a | yes |

## Outputs

No output.
