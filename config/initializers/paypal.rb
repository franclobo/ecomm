PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = process.env.PAYPAL_SANDBOX_USERNAME.to_s
  config.password = process.env.PAYPAL_SANDBOX_PASSWORD.to_s
  config.signature = process.env.PAYPAL_SANDBOX_SIGNATURE.to_s
end
