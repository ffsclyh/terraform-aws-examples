
# Example: 01-sg\_rule  
Creates:
- security group allowing SSH access

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
| description | n/a | `string` | n/a | yes |
| egress\_cidr\_blocks | n/a | `list(any)` | n/a | yes |
| egress\_from\_port | n/a | `number` | n/a | yes |
| egress\_protocol | n/a | `string` | n/a | yes |
| egress\_to\_port | n/a | `number` | n/a | yes |
| egress\_type | n/a | `string` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| group\_name | Name for the security group | `string` | n/a | yes |
| ingress\_cidr\_blocks | n/a | `list(any)` | n/a | yes |
| ingress\_from\_port | n/a | `number` | n/a | yes |
| ingress\_protocol | n/a | `string` | n/a | yes |
| ingress\_to\_port | n/a | `number` | n/a | yes |
| ingress\_type | n/a | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |

## Outputs

No output.
