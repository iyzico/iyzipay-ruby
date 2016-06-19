# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should initialize threeds pre auth with card' do
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12',
        cvc: '123',
        registerCard: 0
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        buyerEmail: 'john@doe.com',
        buyerId: '100',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installment: 1,
        paidPrice: '1',
        price: '1',
        callbackUrl: 'https://www.merchant.com/callback',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card
    }
    threeds_initialize = Iyzipay::Model::BasicThreedsInitializePreAuth.new.create(request, @options)

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

  it 'should initialize threeds pre auth with card token' do
    payment_card = {
        cardToken: 'card token',
        cardUserKey: 'card user key'
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        buyerEmail: 'john@doe.com',
        buyerId: '100',
        buyerIp: '85.34.78.112',
        connectorName: 'isbank',
        installment: 1,
        paidPrice: '1',
        price: '1',
        callbackUrl: 'https://www.merchant.com/callback',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card
    }
    threeds_initialize = Iyzipay::Model::BasicThreedsInitializePreAuth.new.create(request, @options)

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
        paymentId: '1'
    }
    basic_threeds = Iyzipay::Model::BasicThreedsPayment.new.create(request, @options)

    begin
      $stderr.puts basic_threeds.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end