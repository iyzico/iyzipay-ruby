require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Plan API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
plan = Iyzipay::Model::V2::Plan.new
# Create new plan
plan_create_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '12341234',
    productReferenceCode: 'YOUR_PRODUCT_REFERENCE_CODE',
    name: 'Plan Name',
    price: 100.00,
    currencyCode: 'TL',
    paymentInterval: 'MONTHLY',
    paymentIntervalCount: 1,
    trialPeriodDays: 7,
    planPaymentType: 'RECURRING'
}
result = plan.create(plan_create_params, @options)
puts "Plan create: #{result}"

# Update plan
plan_update_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '12341234',
    pricingPlanReferenceCode: 'YOUR_PRICING_PLAN_REFERENCE_CODE',
    name: 'Update Plan',
    trialPeriodDays: 3,
}

result = plan.update(plan_update_params, @options)
puts "Plan update: #{result}"
