terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source      = "../.."
  description = "${var.name} SMTP Policy."
  enable_smtp = true
  mail_alert_recipients = [
    "admin@example.com",
    "noc@example.com"
  ]
  minimum_severity          = "critical"
  name                      = var.name
  organization              = "terratest"
  smtp_alert_sender_address = "ucs@example.com"
  smtp_port                 = 25
  smtp_server_address       = "198.18.1.25"
}
