# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should pay with card' do
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
        buyerId: 'B2323',
        buyerIp: '85.34.78.112',
        connectorName: 'isbank',
        installment: 1,
        paidPrice: '1',
        price: '1',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card
    }
    payment = Iyzipay::Model::BasicPayment.new.create(request, @options)
    begin
      $stderr.puts payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should pay with card token' do
    payment_card = {
        cardToken: 'card token',
        cardUserKey: 'card user key'
    }
    request = {
        locale: 'tr',
        conversationId: '123456789',
        buyerEmail: 'john@doe.com',
        buyerId: 'B2323',
        buyerIp: '85.34.78.112',
        connectorName: 'isbank',
        installment: 1,
        paidPrice: '1',
        price: '1',
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card
    }
    payment = Iyzipay::Model::BasicPayment.new.create(request, @options)
    begin
      $stderr.puts payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end