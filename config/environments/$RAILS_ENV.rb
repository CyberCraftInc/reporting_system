require "smtp_tls"
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  enable_starttls_auto: true,
  address:              'smtp.gmail.com',
  port:                 587,
  user_name:            '',
  password:             '',
  domain:               'gmail.com',
  authentication:       'plain',
}

config.action_mailer.perform_delivers = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_options = {from: ''}
