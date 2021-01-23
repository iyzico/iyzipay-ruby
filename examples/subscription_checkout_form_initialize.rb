require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Checkout Form API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
checkout_form = Iyzipay::Model::V2::CheckoutFormInitialize.new

# Address Params
address = {
    address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
    zipCode: '34732',
    contactName: 'John Doe',
    city: 'Istanbul',
    country: 'Turkey'
}

buyer = {
    name: 'John',
    surname: 'Doe',
    email: 'john.doe@gmail.com',
    gsmNumber: '+905555555555',
    identityNumber: '16038567668',
    billingAddress: address,
    shippingAddress: address
}
# Checkout form initialize params
checkout_form_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '1234512345',
    callbackUrl: 'YOUR_CALLBACK_URL',
    pricingPlanReferenceCode: 'YOUR_PRICING_PLAN_REFERENCE_CODE',
    customer: buyer
}

result = checkout_form.create(checkout_form_params, @options)
puts "Result: #{result}"