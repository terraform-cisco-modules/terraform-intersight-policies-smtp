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
