VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("spec", "vcr")
  config.hook_into :fakeweb
  config.filter_sensitive_data('<TWILIO_TOKEN>') { ENV['TWILIO_TOKEN'] }
  config.filter_sensitive_data('<TWILIO_PHONE_NUMBER>') { ENV['TWILIO_PHONE_NUMBER'] }
  config.filter_sensitive_data('<TWILIO_SID>') { ENV['TWILIO_SID'] }
  config.filter_sensitive_data('<MY_NUMBER>') { ENV['MY_PHONE_NUMBER'] }
end