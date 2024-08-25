PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = ENV['PAYPAL_SANDBOX_USERNAME'].to_s
  config.password = ENV['PAYPAL_SANDBOX_PASSWORD'].to_s
  config.signature = ENV['PAYPAL_SANDBOX_SIGNATURE'].to_s
end
