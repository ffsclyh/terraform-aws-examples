
# Example: 01-single-ec2-instance  
Creates:
- stored public key in aws
- ec2 in default vpc in all subnets

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
| random | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.22.0 |
| random | 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| connection\_details | Connect to the new EC2 instances using: |
| ec2\_public\_ips | Public IPs of EC2 instances |
| key\_name | Key name created in AWS |
