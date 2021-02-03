
# EC2 module

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
| ami\_id | AMI id to be used for EC2 | `string` | n/a | yes |
| associate\_public\_ip\_address | Enable public IP assignment to EC2 instance | `bool` | n/a | yes |
| ec2\_tags | A map of tags to add to ec2 resources | `map(string)` | `{}` | no |
| environment | Environment name | `string` | n/a | yes |
| instance\_name | Name of the instance | `string` | n/a | yes |
| instance\_type | Instance type | `string` | n/a | yes |
| key\_name | public key name | `string` | `""` | no |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| public\_key | public key value | `string` | `""` | no |
| subnet\_ids | Subnets IDs to be associated with the route table | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_security\_group\_ids | List of SG attached to this instance | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| public\_ips | Instances public IPs |
