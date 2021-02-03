
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
| cidr\_blocks | n/a | `list(any)` | n/a | yes |
| from\_port | n/a | `number` | n/a | yes |
| protocol | n/a | `string` | n/a | yes |
| security\_group\_id | Security group ID | `string` | n/a | yes |
| to\_port | n/a | `number` | n/a | yes |
| type | n/a | `string` | n/a | yes |

## Outputs

No output.
