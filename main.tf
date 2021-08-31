terraform {
  required_version = ">= 0.13"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 1.1.0"
    }
  }
}

variable "filename" {
  description = "Name of the variable file including its file extension."
  type        = string
}

data "local_file" "yaml" {
  filename = var.filename
}

output "variables" {
  description = "Contents of the variable file."
  value       = try(yamldecode(trimprefix(data.local_file.yaml.content, "---")), {})
}
