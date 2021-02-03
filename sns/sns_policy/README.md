## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| policy | SNS Policy document as JSON | `string` | n/a | yes |
| sns\_topic\_arn | The ARN of the SNS topic | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_policy | SNS Topic policy |
| sns\_topic\_policy\_arn | SNS Topic policy ARN |
