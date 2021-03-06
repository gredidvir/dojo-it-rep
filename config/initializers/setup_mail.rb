if Rails.env.production? || Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      ENV['SENDGRID_USERNAME'],
    password:       ENV['SENDGRID_PASSWORD'],
    domain:         'heroku.com',
    enable_starttls_auto: true
  }

# elsif Rails.env.development?
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     address:        'smtp.sendgrid.net',
#     port:           '587',
#     authentication: :plain,
#     password:      'vwm91e284668',
#     user_name:       'app63628433@heroku.com',
#     domain:         'heroku.com',
#     enable_starttls_auto: true
#   }
end