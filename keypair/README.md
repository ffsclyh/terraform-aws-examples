
# Dynamic public/private key generator

Do not use this in production! Homelab and troubleshooting purposes only.

## Resources created:

- tls\_private\_key
- aws\_key\_pair
- [optional] downloads private key to the host machine

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| local | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| algorithm | Choose algorithm. Default: RSA | `string` | `"RSA"` | no |
| download\_publickey | Do you want to download newly generated public key? Default no | `bool` | `false` | no |
| environment | Environment name | `string` | `"dev"` | no |
| key\_name | Public key name | `string` | n/a | yes |
| name | Name to be used on all the resources as identifier | `string` | n/a | yes |
| rsa\_bits | Bits for the algorithm. Default: 4096 | `number` | `4096` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_name | Private key name |
| public\_key\_openssh | Public key in openssh format |
