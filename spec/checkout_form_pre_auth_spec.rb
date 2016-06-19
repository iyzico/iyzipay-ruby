# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should initialize checkout form' do
    buyer = {
        id: 'BY789',
        name: 'John',
        surname: 'Doe',
        identityNumber: '74300864791',
        email: 'email@email.com',
        gsmNumber: '+905350000000',
        registrationDate: '2013-04-21 15:12:09',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        city: 'Istanbul',
        country: 'Turkey',
        zipCode: '34732',
        ip: '85.34.78.112'
    }
    address = {
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        zipCode: '34732',
        contactName: 'John Doe',
        city: 'Istanbul',
        country: 'Turkey'
    }

    item1 = {
        id: 'BI101',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.3',
        subMerchantKey: 'sub merchant key',
        subMerchantPrice: '0.27'
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '0.5',
        subMerchantKey: 'sub merchant key',
        subMerchantPrice: '0.42'
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.2',
        subMerchantKey: 'sub merchant key',
        subMerchantPrice: '0.18'
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        price: '1.0',
        paidPrice: '1.0',
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::PRODUCT,
        callbackUrl: 'https://www.merchant.com/callback',
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    checkout_form_initialize = Iyzipay::Model::CheckoutFormInitializePreAuth.new.create(request, @options)

    begin
      $stderr.puts checkout_form_initialize.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end