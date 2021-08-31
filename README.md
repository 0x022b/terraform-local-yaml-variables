# Terraform Local YAML Variables

Terraform module to load variables from a YAML file on local filesystem.

## Usage example

### `my-variables.yaml`

```yaml
count: 3
instance_type: t2.micro
```

### `main.tf`

```hcl
module "yaml" {
  source  = "0x022b/yaml-variables/local"
  version = "~> 1.0"

  filename = "./my-variables.yaml"
}

resource "aws_instance" "cluster" {
  count = module.yaml.variables.count

  instance_type = module.yaml.variables.instance_type
  # ...
}
```

## Inputs

Name      | Description
----------|-------------
filename  | Name of the variable file including its file extension.

## Outputs

Name      | Description
----------|-------------
variables | Variables that were defined in the input file.

## License

MIT
