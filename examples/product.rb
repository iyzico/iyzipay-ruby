require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Product API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
product = Iyzipay::Model::V2::Product.new
# List all products
result = product.list(@options)
puts "Product list: #{result.inspect}"

# Create new product
product_create_params = {
    locale: Iyzipay::Model::Locale::TR,
    conversationId: '12341234',
    name: 'New Product',
    description: 'My Product'
}
result = product.create(product_create_params, @options)
puts "Product create: #{result}"

# Update product
product_update_params = {
    locale: Iyzipay::Model::Locale::TR,
    productReferenceCode: 'YOUR_PRODUCT_REFERENCE_CODE',
    name: 'Update Product',
    description: 'My Product'
}
result = product.update(product_update_params, @options)
puts "Product update: #{result}"
