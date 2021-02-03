## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | Account ID for SNS topic policy | `number` | n/a | yes |
| sns\_topic\_name | SNS Topic name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_arn | SNS Topic ARN |
| sns\_topic\_dump | SNS Topic dump |
