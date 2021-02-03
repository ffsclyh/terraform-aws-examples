
# State bucket used to store terraform state files  
This module creates S3 bucket, used by Terraform to store its state files  
Please go to [example](example/create\_bucket) for more information

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment: dev/stage/prod | `string` | n/a | yes |
| name | Name for the state bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_arn | n/a |
