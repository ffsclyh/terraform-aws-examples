# HashiCorp Certified: Terraform Associative 2020

This folder contains the information about the terraform associate examples and its related study materials.

One could find **study_guide** which contains the TOC and more information on theory and some examples which are more critical to exam.

## Flashcard
```
https://www.brainscape.com/packs/terraform-associate-certification-15603211
```


# code01
sample application

This code could be reviewed for basic terraform resource creation, variables, outputs defined, and orer of precedence. variables defined with types are most important so that integrity check is performed before plan.

this would create an resource defined vars and terraform.tfvars which is defined as a global vars file. you would define the type of vars in the vars.tf and by default terraform would pick from terraform.tfvars file.

```
terraform plan
```

If there is customized file, you need to explicitly say from the command line.

```
terraform plan -var-file="somefile.tfvars"
```

You could also define using the ENV vars.

```
export TF_VAR_<varsname>="value"
```

# code02

These are being discussed over here

- Data and mapping in the list in variables
- count and count index
- interpolations - if the environment == dev only 2 instances are created or 1 instance created.
- create local variables which can be used across different resources


# code03
functions

code explains more on the functions

- element using list
- mapping on regions
- dynamic mapping

## terraform debugging

default, most verbose mode are TRACE,  there are other different log levels as well

e.g: 

TRACE
DEBUG
INFO
WARN
ERROR

```
export TF_LOG=TRACE
```
Persist logged output and inorder to force the log to always appended to specific file when logging is enabled.

```
export TF_LOG_PATH=""/tmp/tf-crashdump.log"
```
# code04

- terraform provisioners (remote-exec, local-exec)


# code05

## Modules

Define your own modules so that you can just reference those instead of re-writing the code again.

Let the modules be in the root directory and inside you can create your own projects which can be referenced those modules.

example:

```
mkdir -p projectRoot/modules/projects
cd projectRoot/modules
# create your own modules for each resource in this directory.

cd projects
# main.tf just reference the modules.
modules "ec2" {
  src = "../modules/<resources>"
}
```

# code06

# terraform registry

you could find all the modules which are pre-defined to quickly deploy common infrastructure configurations.

https://registry.terraform.io/

# code07

## workspaces

Summary

workspaces are the pre-defined environment which can be used to create all the resources in particular for the "dev" or the "prod" environment

Few commands from the terraform workspaces

```
terraform workspace show
terraform workspace new dev
terraform workspace new prod
terraform workspace list
terraform workspace select dev
```

# code08

# Remote state management

terraform state list :  lists the resource within terrform.tfstate files
terraform state mv  : moves item with terraform.tfstate
terraform state pull : manually download and output the state from remote state
terraform state push : upload a local state file to remote state
terraform state rm : remove items from the terraform.tfstate
terraform state show : shows the attributes of a single resource in the state.

# code09

# Multiple AWS accounts and Providers

## Description

### Single AWS account with multiple regions

we could use multiple regions of the same account using terraform by "alias" in the provider.
we have created two of the EIP on single AWS account with two different regions.

### Multiple AWS accounts with Single/Multiple regions
In provider, specify "profile" to whatever has been set in your ~/.aws/credentials of the different account.

# code10

# sensitive parameters

sensitive=true will prevent field's value from showing up in CLI output and in terraform cloud, however it will not encrypt or obscure the value in the state file.