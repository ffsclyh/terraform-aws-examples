
# Example: create\_bucket  
Creates:
- S3 state bucket

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

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment: dev/stage/prod | `string` | n/a | yes |
| name | Name for the state bucket | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_arn | State bucket ARN |
