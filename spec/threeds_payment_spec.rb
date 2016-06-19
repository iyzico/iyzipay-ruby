# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should create payment with physical and virtual item for standard merchant' do
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12',
        cvc: '123',
        registerCard: 0
    }
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
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '0.5',
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.2',
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        price: '1.0',
        paidPrice: '1.1',
        installment: 1,
        paymentChannel: Iyzipay::Model::PaymentChannel::WEB,
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::PRODUCT,
        callbackUrl: 'https://www.merchant.com/callback',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card,
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    threeds_initialize = Iyzipay::Model::ThreedsInitialize.new.create(request, @options)
    begin
      $stderr.puts threeds_initialize.inspect
      threeds_initialize_dict = JSON.parse(threeds_initialize)
      unless threeds_initialize_dict['threeDSHtmlContent'].nil?
        $stderr.puts Base64.decode64(threeds_initialize_dict['threeDSHtmlContent']).inspect
      end
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should create three payment with physical and virtual item for market place' do
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12',
        cvc: '123',
        registerCard: 0
    }
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
        paidPrice: '1.1',
        installment: 1,
        paymentChannel: Iyzipay::Model::PaymentChannel::WEB,
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::PRODUCT,
        callbackUrl: 'https://www.merchant.com/callback',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card,
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    threeds_initialize = Iyzipay::Model::ThreedsInitialize.new.create(request, @options)
    begin
      $stderr.puts threeds_initialize.inspect

      threeds_initialize_dict = JSON.parse(threeds_initialize)
      unless threeds_initialize_dict['threeDSHtmlContent'].nil?
        $stderr.puts Base64.decode64(threeds_initialize_dict['threeDSHtmlContent']).inspect
      end
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should auth threeds' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        paymentId: '1',
        conversationData: 'conversation data',
    }
    threeds_payment = Iyzipay::Model::ThreedsPayment.new.create(request, @options)
    begin
      $stderr.puts threeds_payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should retrieve payment' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        paymentId: '9',
        paymentConversationId: '123456789',
    }
    threeds_payment = Iyzipay::Model::ThreedsPayment.new.retrieve(request, @options)
    begin
      $stderr.puts threeds_payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end