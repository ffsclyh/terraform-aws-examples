
# Example: create\_lock\_table  
Creates:
- DynamoDB tablo used for locks

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

No input.

## Outputs

| Name | Description |
|------|-------------|
| table\_name | Name of the dynamoDB lock table |
