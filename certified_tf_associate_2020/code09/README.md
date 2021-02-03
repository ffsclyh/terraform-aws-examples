# code09

# Multiple AWS accounts and Providers

## Description

### Single AWS account with multiple regions

we could use multiple regions of the same account using terraform by "alias" in the provider.
we have created two of the EIP on single AWS account with two different regions.

### Multiple AWS accounts with Single/Multiple regions
In provider, specify "profile" to whatever has been set in your ~/.aws/credentials of the different account.
