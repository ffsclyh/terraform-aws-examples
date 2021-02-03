
# Example: 01-public\_subnets  
Creates:
- custom vpc using the module (needed for the subnets)
- public subnets in 3xAZs using the module

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

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
| map\_public\_ip | Enable public IP | `bool` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| subnet\_cidr\_blocks | Subnet CIDR blocks | `list(string)` | n/a | yes |
| subnet\_suffix | Suffix to append to subnets name | `string` | n/a | yes |
| subnet\_tags | Additional tags for the subnets | `map(string)` | `{}` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnets\_ids | Subnet ids |
| vpc\_id | Custom VPC id |
