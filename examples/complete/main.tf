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
