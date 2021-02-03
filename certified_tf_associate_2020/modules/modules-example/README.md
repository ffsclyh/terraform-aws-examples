# Modules 

base will be the basis for our infrastructure, it will include the vpc, security groups etc, while web will be the instance and the load balancer.

```
├── base
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
└── web
    ├── main.tf
    ├── outputs.tf
    └── variables.tf
```
