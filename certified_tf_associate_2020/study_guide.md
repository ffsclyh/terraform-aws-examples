# Study Guide - Terraform Associate Certification

Important points to be covered for the exam.
https://learn.hashicorp.com/terraform/certification/terraform-associate-study-guide

We would go through some of the important points as we read through above study guide in theory.

## TOC

### Learn about IaC
- IaC makes it easy to provision and apply infrastructure configurations, saving time. It standardizes workflows across different infrastructure providers (e.g., VMware, AWS, Azure, GCP, etc.) by using a common syntax across all of them.
- **Makes infra more reliable**, IaC makes changes idempotent, consistent, repeatable, and predictable.
- With IaC, we can test the code and review the results before the code is applied to our target environments.
- Since code is checked into version control systems such as GitHub, GitLab, BitBucket, etc., it is possible to review how the infrastructure evolves over time.
- **Makes infra more manageable**, IaC provides benefits that enable mutation, when necessary

**Terraform use case**
- **Heroku App Setup**
- **Multi-Tier Applications**
- **Self-Service Clusters**
- **Software Demos**
- **Disposable Environments**
- **Software Defined Networking**
- **Resource Schedulers**
- **Multi-Cloud Deployment**, Terraform is cloud-agnostic and allows a single configuration to be used to manage multiple providers, and to even handle cross-cloud dependencies. This simplifies management and orchestration, helping operators build large-scale multi-cloud infrastructures.

### Manage infrastructure
https://github.com/terraform-providers/terraform-provider-aws

**terraform init**, Running this command will download and initialize any providers that are not already initialized and are installed in the current working directory.

**Note:** terraform init cannot automatically download providers that are not distributed by HashiCorp(0.0.12v), however it is possible in terraform version(0.0.13v)

To upgrade to latest version of all terraform modules ```terraform init -upgrade```
you can also use provider constraints using "version" within a provider block but that declares a new provider configuration that may cause problems particularly when writing shared modules. Hence recommended using **required_providers**

To defined multiple providers you can use "alias", all the plugins would be installed in below location
```
windows: %APPDATA%\terraform.d\plugins
Linux: ~/.terraform.d/plugins
```
OS which are supported by terraform,
```
darwin
freebsd
linux
openbsd
solaris
windows
```
**purpose of terraform state:**

**Mapping to the Real World**, When you have a resource resource "aws_instance" "foo" in your configuration, Terraform uses this map to know that instance i-abcd1234 is represented by that resource.

**Metadata**, track resource dependencies(implicit/explicit)

**Performance**, When running a terraform plan, Terraform must know the current state of resources in order to effectively determine the changes that it needs to make to reach your desired configuration.

**Syncing**, Terraform can use remote locking as a measure to avoid two or more different users accidentally running Terraform at the same time, and thus ensure that each Terraform run begins with the most recent updated state.

**terraform settings**, "required_version" setting can be used to constrain which versions of the Terraform CLI can be used with your configuration

```
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
    }
  }
}
```

**provisioners**

Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.
https://www.terraform.io/docs/provisioners/#provisioners-are-a-last-resort

### Master the workflow
**Core Terraform workflow**
- **write**, Author infrastructure as code.
- **plan**,  Preview changes before applying.
- **apply**, Provision reproducible infrastructure.

**terraform init**
- **Copy a Source Module**, During init, it assumes that the working directory already contains a configuration and will attempt to initialize that configuration.

- **Backend Initialization**, During init, the root configuration directory is consulted for backend configuration and the chosen backend is initialized using the given configuration settings.

- **Child Module Installation**, During init, the configuration is searched for module blocks, and the source code for referenced modules is retrieved from the locations given in their source arguments.

- **Plugin Installation**, For providers distributed by HashiCorp, init will automatically download and install plugins if necessary. Plugins can also be manually installed in the user plugins directory, located at ~/.terraform.d/plugins on most operating systems and %APPDATA%\terraform.d\plugins on Windows.

**terraform validate**
Validate runs checks that verify whether a configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state. It is thus primarily useful for general verification of reusable modules, including correctness of attribute names and value types.

**terraform plan**
The terraform plan command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

By default, plan requires no flags and looks in the current directory for the configuration and state file to refresh.

```
exitcodes: Return a detailed exit code when the command exits
0 = Succeeded with empty diff (no changes)
1 = Error
2 = Succeeded with non-empty diff (changes present)

parallelism=n - Limit the number of concurrent operation as Terraform walks the graph. Defaults to 10.
```
Terraform itself does not encrypt the plan file. It is highly recommended to encrypt the plan file if you intend to transfer it or keep it at rest for an extended period of time.

**terraform apply**
The terraform apply command is used to apply the changes required to reach the desired state of the configuration, or the pre-determined set of actions generated by a terraform plan execution plan.

**terraform destroy**
The terraform destroy command is used to destroy the Terraform-managed infrastructure.

The *-target* flag, instead of affecting "dependencies" will instead also destroy any resources that depend on the target(s) specified. The behavior of any terraform destroy command can be previewed at any time with an equivalent.
**terraform plan -destroy command**

### Learn more subcommands

**terraform force-unlock**
Manually unlock the state for the defined configuration. This command removes the lock on the state for the current configuration. The behavior of this lock is dependent on the backend being used. Local state files cannot be unlocked by another process.

**terraform fmt**
command is used to rewrite Terraform configuration files to a canonical format and style

```
-list=false - Don't list the files containing formatting inconsistencies.
-write=false - Don't overwrite the input files. (This is implied by -check or when the input is STDIN.)
-diff - Display diffs of formatting changes
-check - Check if the input is formatted. Exit status will be 0 if all input is properly formatted and non-zero otherwise.
-recursive - Also process files in subdirectories. By default, only the given directory (or current directory) is processed.
```

**terraform taint**
command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply. This command will not modify infrastructure, but does modify the state file in order to mark a resource as tainted.

**terraform state**
command is used for advanced state management, Terraform usage becomes more advanced, there are some cases where you may need to modify the *terraform.tfstate*

**terraform workspaces**
Terraform starts with a single workspace named "default". This workspace is special both because it is the default and also because it cannot ever be deleted.

For local state, Terraform stores the workspace states in a directory called *terraform.tfstate.d*. some teams commit these files to version control, although using a remote backend instead is recommended when there are multiple collaborators.

For remote state, the workspaces are stored directly in the configured backend.
Multiple workspaces are currently supported by the following backends

```
AzureRM
Consul
COS
GCS
Local
Manta
Postgres
Remote
S3
```

**Note:** Workspaces, managed with the terraform workspace command, isn't the same thing as Terraform Cloud's workspaces. Terraform Cloud workspaces act more like completely separate working directories.

**terraform import**
Import will find the existing resource from ID and import it into your Terraform state at the given ADDRESS. ADDRESS must be a valid resource address.

Terraform will attempt to load configuration files that configure the provider being used for import. If no configuration files are present or no configuration for that specific provider is present, Terraform will prompt you for access credentials. You may also specify environmental variables to configure the provider.

The only limitation Terraform has when reading the configuration files is that the import provider configurations must not depend on non-variable inputs.

```
terraform import aws_instance.foo i-abcd1234
terraform import 'aws_instance.baz[0]' i-abcd1234
terraform import 'aws_instance.baz["example"]' i-abcd1234
```

**terraform output**
command is used to extract the value of an output variable from the state file.

**terraform refresh**
command is used to reconcile the state Terraform knows about (via its statefile) with the real-world infrastructure. This can be used to detect any drift from the last-known state, and to update the state file. This does not modify infrastructure, but does modify the state file. If the state is changed, this may cause changes to occur during the next plan or apply.

**terraform show**
The terraform show command is used to provide human-readable output from a state or plan file. This can be used to inspect a plan to ensure that the planned operations are expected, or to inspect the current state as Terraform sees it.

### Use and create modules
Terraform Registry makes it simple to find and use modules.(https://registry.terraform.io/)
The syntax for referencing a registry module **<NAMESPACE>/<NAME>/<PROVIDER>** (hashicorp/consul/aws)

You can also use modules from a private registry of the form **<HOSTNAME>/<NAMESPACE>/<NAME>/<PROVIDER>** (app.terraform.io/example_corp/vpc/aws)

**Module versioning**
We recommend explicitly constraining the acceptable version numbers for each external module to avoid unexpected or unwanted changes
```
module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.0.5"
  servers = 3
}
```

**variables**
The name of a variable can be any valid identifier except the following,
```
source
version
providers
count
for_each
lifecycle
depends_on
locals
```

variables on the command line can be associated like below

```
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]'
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```

Terraform also automatically loads a number of variable definitions files if they are present,
It's more convenient to specify their values in a variable definitions file *terraform.tfvars* or *terraform.tfvars.json* or names ending with *.auto.tfvars* or *.auto.tfvars.json*

```
terraform apply -var-file="custom.tfvars"
```

Terraform searches the environment of its own process for environment variables named TF_VAR_ followed by the name of a declared variable.

```
export TF_VAR_ami_id="abd"
```

If a root module variable uses a type constraint to require a complex value (list, set, map, object, or tuple), Terraform will instead attempt to parse its value using the same syntax used within variable definitions files.

```
export TF_VAR_availability_zone_names='["us-west-1b","us-west-1d"]'
```

**Variable Definition Precedence**
```
- Environment variables
- The terraform.tfvars file, if present.
- The terraform.tfvars.json file, if present.
- Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
- Any -var and -var-file options on the command line, in the order they are provided.
```

Q) In order to make a Terraform configuration file dynamic and/or reusable, static values should be converted to use what?

Solution: Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations.

### Read and write configuration
**Resources**
Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.

A resource block declares a resource of a given type ("aws_instance") with a given local name ("web"). The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside of the scope of a module

**Meta-Arguments**
```
- depends_on, for specifying hidden dependencies
- count, for creating multiple resource instances according to a count
- for_each, to create multiple instances according to a map, or set of strings
- provider, for selecting a non-default provider configuration
- lifecycle, for lifecycle customizations
- provisioner and connection, for taking extra actions after resource creation
```
Explicitly specifying a dependency is only necessary when a resource relies on some other resource's behavior but doesn't access any of that resource's data in its arguments.
e.g, creation of s3 bucket before aws_instance is provisioned.

**Data sources**
Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.

**References to Named Values**
- <RESOURCE TYPE>.<NAME> is an object representing a managed resource of the given type and name.
- var.<NAME> is the value of the input variable of the given name.
- local.<NAME> is the value of the local value of the given name.
- module.<MODULE NAME>.<OUTPUT NAME> is the value of the specified output value from a child module called by the current module.
- data.<DATA TYPE>.<NAME> is an object representing a data resource of the given data source type and name. If the resource has the count argument set, the value is a list of objects representing its instances. If the resource has the for_each argument set, the value is a map of objects representing its instances.
- path.module is the filesystem path of the module where the expression is placed.
- path.root is the filesystem path of the root module of the configuration.
- path.cwd is the filesystem path of the current working directory. In normal use of Terraform this is the same as path.root, but some advanced uses of Terraform run it from a directory other than the root module directory, causing these paths to be different.
- terraform.workspace is the name of the currently selected workspace.

**Local Named Values**
```
count.index, in resources that use the count meta-argument.
each.key / each.value, in resources that use the for_each meta-argument.
self, in provisioner and connection blocks.
```

**References to Resource Attributes**
The most common reference type is a reference to an attribute of a resource which has been declared either with a resource or data block

```
resource "aws_instance" "example" {
  ami           = "ami-abc123"
  instance_type = "t2.micro"

  ebs_block_device {
    device_name = "sda2"
    volume_size = 16
  }
```

**dynamic blocks**
Within top-level block constructs like resources, expressions can usually be used only when assigning a value to an argument using the name = expression form.

```
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name"
  application         = "${aws_elastic_beanstalk_application.tftest.name}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.11.4 running Go 1.12.6"

  dynamic "setting" {
    for_each = var.settings
    content {
      namespace = setting.value["namespace"]
      name = setting.value["name"]
      value = setting.value["value"]
    }
  }
}
```

**Type Constraints**
https://www.terraform.io/docs/configuration/types.html
 primitive type is a simple type that isn't made from any other types.
 - string
 - number
 - bool

**Complex types**
  **Collection Types**
  A collection type allows multiple values of one other type to be grouped together as a single value. The type of value within a collection is called its element type.
  - list
  - map
  - set
  **Structural types**
  A structural type allows multiple values of several distinct types to be grouped together as a single value.
  - object
  - tuple

**Built-in-functions**
https://www.terraform.io/docs/configuration/functions.html

**string**
chomp
format
formatlist
indent
join
lower
regex
regexall
replace
split
strrev
substr
title
trim
trimprefix
trimsuffix
trimspace
upper

**Numberic**
abs
ceil
floor
log
max
min
parseint
pow
signum

### Manage state

**state locking**
If supported by your backend, Terraform will lock your state for all operations that could write state. This prevents others from acquiring the lock and potentially corrupting your state. State locking happens automatically on all operations that could write state.

**force-unlock**, Be very careful with this command. If you unlock the state when someone else is holding the lock it could cause multiple writers. Force unlock should only be used to unlock your own lock in the situation where automatic unlocking failed.

**Sensitive Data in State**
Terraform state can contain sensitive data, depending on the resources in use and your definition of "sensitive." The state contains resource IDs and all resource attribute. When using *local state*, state is stored in plain-text JSON files.

When using *remote state*, state is only ever held in memory when used by Terraform. It may be encrypted at rest, but this depends on the specific remote state backend.

Terraform Cloud always encrypts state at rest and protects it with TLS in transit. Terraform Cloud also knows the identity of the user requesting state and maintains a history of state changes. This can be used to control access and track activity. Terraform Enterprise also supports detailed audit logging.

The S3 backend supports encryption at rest when the encrypt option is enabled. IAM policies and logging can be used to identify any invalid access. Requests for the state go over a TLS connection.

**backends**
A "backend" in Terraform determines how state is loaded and how an operation such as apply is executed.

*benefits of backends*
- *Working in a team*, Backends can store their state remotely and protect that state with locks to prevent corruption
- *Keeping sensitive information off disk*, State is retrieved from backends on demand and only stored in memory
- *Remote operations*,  For larger infrastructures or certain changes, terraform apply can take a long, long time

With a partial configuration, the remaining configuration arguments must be provided as part of the initialization process

*Interactively*: Terraform will interactively ask you for the required values, unless interactive input is disabled.
*File*: A configuration file may be specified via the init command line. To specify a file, use the *-backend-config=PATH* option when running terraform init.
*Command-line key/value pairs*: Key/value pairs can be specified via the init command line. Note that many shells retain command-line flags in a history file, so this isn't recommended for secrets. To specify a single key/value pair, use the *-backend-config="KEY=VALUE"* option when running terraform init.

**changing configuration**
You can change your backend configuration at any time. You can change both the configuration itself as well as the type of backend (for example from "consul" to "s3").

Terraform will automatically detect any changes in your configuration and request a reinitialization. As part of the reinitialization process, Terraform will ask if you'd like to migrate your existing state to the new configuration. This allows you to easily switch from one backend to another.

**unconfiguring backend**
If you no longer want to use any backend, you can simply remove the configuration from the file.

**local backend**
The local backend stores state on the local filesystem, locks that state using system APIs, and performs operations locally.

```
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}

```
Render your data from the path of the terraform.tfstate that exists locally.
```
data "terraform_remote_state" "foo" {
  backend = "local"

  config = {
    path = "${path.module}/../../terraform.tfstate"
  }
}
```

**Backend Types**
- Standard
- Enhanced

*Manual State Pull/Push*
You can still manually retrieve the state from the remote state using the *terraform state pull* command. You can also manually write state with terraform state push. This is extremely dangerous and should be avoided if possible. This will overwrite the remote state. This can be used to do manual fixups if necessary.

### Debug in Terraform
Terraform has detailed logs which can be enabled by setting the *TF_LOG* environment variable to any value. This will cause detailed logs to appear on stderr

You can set TF_LOG to one of the log levels *TRACE, DEBUG, INFO, WARN or ERROR* to change the verbosity of the logs. **TRACE** is the most verbose and it is the default if TF_LOG is set to something other than a log level name.

To persist logged output you can set **TF_LOG_PATH** in order to force the log to always be appended to a specific file when logging is enabled

### Understand Terraform Cloud and Enterprise

**Terraform Cloud and Terraform Enterprise**

Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations.

*terraform cloud features*
- Terraform Workflow
- Remote Terraform Execution
- Workspaces for Organizing Infrastructure
- Remote State Management, Data Sharing, and Run Triggers
- Version Control Integration
- Command Line Integration
- Private Module Registry

*terraform cloud integrations*
- Full API
- Notifications

*ACL and Governance*
- Team based permissions systems
- Sentinel policies
- Cost Estimations

Terraform Cloud supports the following VCS providers.

```
GitHub
GitHub.com (OAuth)
GitHub Enterprise
GitLab.com
GitLab EE and CE
Bitbucket Cloud
Bitbucket Server
Azure DevOps Server
Azure DevOps Services
```

Terraform Enterprise, our self-hosted distribution of Terraform Cloud. It offers enterprises a private instance of the Terraform Cloud application, with no resource limits and with additional enterprise-grade architectural features like audit logging and SAML single sign-on.

**Sentinel Overview**
It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources.

Sentinel with Terraform Cloud involves,
*Defining the policies*: Policies are defined using the policy language with imports for parsing the Terraform plan, state and configuration.
*Managing policies for organizations*: Users with permission to manage policies can add policies to their organization by configuring VCS integration or uploading policy sets through the API
*Enforcing policy checks on runs*:  Policies are checked when a run is performed, after the terraform plan but before it can be confirmed or the terraform apply is executed
*Mocking Sentinel Terraform data*: Terraform Cloud provides the ability to generate mock data for any run within a workspace

**Terraform language**
Terraform is not a configuration management tool.
Terraform is a declarative language.
Terraform supports a syntax that is JSON compatible.
Terraform is primarily designed on immutable infrastructure principles.

Terraform analyses any expressions within a resource block to find references to other objects and treats those references as implicit ordering requirements when creating, updating, or destroying resources.
