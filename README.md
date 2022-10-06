<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/terraform-cisco-modules/terraform-intersight-policies-smtp/actions/workflows/terratest.yml/badge.svg)](https://github.com/terraform-cisco-modules/terraform-intersight-policies-smtp/actions/workflows/terratest.yml)
# Terraform Intersight Policies - SMTP
Manages Intersight SMTP Policies

Location in GUI:
`Policies` » `Create Policy` » `SMTP`

## Easy IMM

[*Easy IMM - Comprehensive Example*](https://github.com/terraform-cisco-modules/easy-imm-comprehensive-example) - A comprehensive example for policies, pools, and profiles.

## Example

### main.tf
```hcl
module "smtp" {
  source  = "terraform-cisco-modules/policies-smtp/intersight"
  version = ">= 1.0.1"

  description = "default SMTP Policy."
  enable_smtp = true
  mail_alert_recipients = [
    "admin@example.com",
    "noc@example.com"
  ]
  minimum_severity          = "critical"
  name                      = "default"
  organization              = "default"
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
$env:TF_VAR_secretkey="<secret-key-file-location>"
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Policy. | `string` | `""` | no |
| <a name="input_enable_smtp"></a> [enable\_smtp](#input\_enable\_smtp) | If enabled, controls the state of the SMTP client service on the managed device. | `bool` | `true` | no |
| <a name="input_minimum_severity"></a> [minimum\_severity](#input\_minimum\_severity) | Minimum fault severity level to receive email notifications. Email notifications are sent for all faults whose severity is equal to or greater than the chosen level.<br>* critical - Minimum severity to report is critical.<br>* condition - Minimum severity to report is informational.<br>* warning - Minimum severity to report is warning.<br>* minor - Minimum severity to report is minor.<br>* major - Minimum severity to report is major. | `string` | `"critical"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the Policy. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_profiles"></a> [profiles](#input\_profiles) | List of Profiles to Assign to the Policy.<br>* name - Name of the Profile to Assign.<br>* object\_type - Object Type to Assign in the Profile Configuration.<br>  - server.Profile - For UCS Server Profiles.<br>  - server.ProfileTemplate - For UCS Server Profile Templates. | <pre>list(object(<br>    {<br>      name        = string<br>      object_type = optional(string, "server.Profile")<br>    }<br>  ))</pre> | `[]` | no |
| <a name="input_smtp_alert_sender_address"></a> [smtp\_alert\_sender\_address](#input\_smtp\_alert\_sender\_address) | The email address entered here will be displayed as the from address (mail received from address) of all the SMTP mail alerts that are received. If not configured, the hostname of the server is used in the from address field. | `string` | `"ucs@example.com"` | no |
| <a name="input_smtp_port"></a> [smtp\_port](#input\_smtp\_port) | Port number used by the SMTP server for outgoing SMTP communication.  Valid range is between 1-65535. | `number` | `25` | no |
| <a name="input_mail_alert_recipients"></a> [mail\_alert\_recipients](#input\_mail\_alert\_recipients) | List of Emails to send alerts to. | `list(string)` | `[]` | no |
| <a name="input_smtp_server_address"></a> [smtp\_server\_address](#input\_smtp\_server\_address) | IP address or hostname of the SMTP server. The SMTP server is used by the managed device to send email notifications. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | SMTP Policy Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_smtp_policy.smtp](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/smtp_policy) | resource |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [intersight_server_profile.profiles](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/server_profile) | data source |
| [intersight_server_profile_template.templates](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/server_profile_template) | data source |
<!-- END_TF_DOCS -->