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
