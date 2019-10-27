if Rails.env.production?
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: ENV['MAILER_TO'],
  password: ENV['MAILER_PASS'],
  authentication: 'plain',
  enable_starttls_auto: true
 }
 elsif Rails.env.development?
  # 開発環境
  ActionMailer::Base.delivery_method = :letter_opener
else
  # テスト環境
  ActionMailer::Base.delivery_method = :test
end