Terraform workspaces enable us to manage multiple deployments of the same configuration. When we create cloud resources using the Terraform configuration language, the resources are created in the default workspace. It is a very handy tool that lets us test configurations by giving us flexibility in resource allocation, regional deployments, multi-account deployments, and so on.


terraform workspace --help
Usage: terraform [global options] workspace

  new, list, show, select, and delete Terraform workspaces.

Subcommands:
    delete    Delete a workspace
    list      List Workspaces
    new       Create a new workspace
    select    Select a workspace
    show      Show the name of the current workspace


    Managing variables with Terraform workspaces is essential when you need different configurations for different environments, like dev, test, stage, and prod. 

First, you need to declare the variables as you would normally do for any Terraform configuration. Providing values to these variables can be done easily by using tfvars files.

For each environment, you can declare a tfvars file:

vars_dev.tfvars
vars_test.tfvars
vars_stage.tfvars
vars_prod.tfvars

Based on the workspace you are on (let’s suppose you are on the dev workspace), you will run an apply like:

terraform apply –var-file=vars_dev.tfvars

You can also conditionally assign values to different parameters based on the workspace. Let’s take a look at an example:

locals {
  instance_type = terraform.workspace == “prod” ? “t2.large” : “t2.micro”
}