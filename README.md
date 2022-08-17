# Terraform Kubernetes Environment

![pipeline](https://github.com/cktf/terraform-kubernetes-environment/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-kubernetes-environment?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-kubernetes-environment)

**Environment** is a Terraform module useful for creating an environment resources in **Kubernetes** provider

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "environment" {
  source = "cktf/environment/kubernetes"

  name = "staging"
  registry = {
    endpoint = "<REGSITRY_ENDPOINT>"
    username = "<REGSITRY_USERNAME>"
    password = "<REGSITRY_PASSWORD>"
  }
  quota = {
    cpu    = "1000"
    memory = "200Gi"
    pods   = "10"
  }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
