require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Operations API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
subscription = Iyzipay::Model::V2::Subscription.new

# Activate
activate_params = {
    subscriptionReferenceCode: 'YOUR_CODE',
}
response = subscription.activate(activate_params, @options)
puts "Subscription activate: #{response}"

# Cancel
cancel_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '1234512345',
    subscriptionReferenceCode: 'YOUR_CODE'
}
response = subscription.cancel(cancel_params, @options)
puts "Subscription cancel: #{response}"

# Retry
retry_params = {
    referenceCode: 'YOUR_CODE'
}

result = subscription.retry(retry_params, @options)
puts "Subscription retry: #{result}"