# sample application

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
