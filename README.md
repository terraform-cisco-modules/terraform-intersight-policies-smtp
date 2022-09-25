<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Policies - SMTP
Manages Intersight SMTP Policies

Location in GUI:
`Policies` » `Create Policy` » `SMTP`

## Example

### main.tf
```hcl
module "smtp" {
  source  = "terraform-cisco-modules/policies-smtp/intersight"
  version = ">= 1.0.1"

  description  = "default SMTP Policy."
  name         = "default"
  organization = "default"
  enable_smtp  = true
  mail_alert_recipients = [
    "admin@example.com",
    "noc@example.com"
  ]
  minimum_severity          = "critical"
  smtp_alert_sender_address = "ucs@example.com"
  smtp_port                 = 25
  smtp_server_address       = "198.18.1.25"
}
```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```
<!-- END_TF_DOCS -->