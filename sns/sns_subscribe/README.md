## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| endpoint | The endpoint to send data to, the contents will vary with the protocol | `string` | n/a | yes |
| protocol | The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported) | `string` | n/a | yes |
| sns\_topic\_arn | The ARN of the SNS topic to subscribe to | `string` | n/a | yes |

## Outputs

No output.
