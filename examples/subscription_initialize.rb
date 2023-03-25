require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Initialize API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
subscription = Iyzipay::Model::V2::SubscriptionInitialize.new
# Address
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
    gsmNumber: '+905422073160',
    identityNumber: '16038567668',
    billingAddress: address,
    shippingAddress: address
}
# Card
card = {
    cardHolderName: 'John Doe',
    cardNumber: '5528790000000008',
    expireMonth: '12',
    expireYear: '2030',
    cvc: '123',
    registerConsumerCard: true
}
# Create new product
checkout_form_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '1234512345',
    callbackUrl: 'https://iyzipay-subscription.herokuapp.com/subscriptions/callback',
    pricingPlanReferenceCode: 'YOUR_PRICING_PLAN_REFERENCE_CODE',
    customer: buyer,
    paymentCard: card
}
result = subscription.create(checkout_form_params, @options)
puts "Subscription create: #{result}"
