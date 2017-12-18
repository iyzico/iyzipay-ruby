# coding: utf-8

require_relative 'spec_helper'
require_relative 'builder'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = SpecOptions::API_KEY
    @options.secret_key = SpecOptions::SECRET_KEY
    @options.base_url = SpecOptions::BASE_URL
  end

  it 'should refund payment' do
    # create payment
    payment =  Builder::PaymentBuilder.new.create_standard_listing_payment(@options)

    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        paymentTransactionId: payment['itemTransactions'][0]['paymentTransactionId'],
        price: '0.2',
        currency: Iyzipay::Model::Currency::TRY,
        ip: '85.34.78.112'
    }
    refund = Iyzipay::Model::Refund.new.create(request, @options)
    begin
      $stdout.puts refund.inspect
      refund = JSON.parse(refund)
      expect(refund['status']).to eq('success')
      expect(refund['locale']).to eq('tr')
      expect(refund['systemTime']).not_to be_nil
      expect(refund['conversationId']).to eq('123456789')
      expect(refund['paymentId']).to eq(payment['paymentId'])
      expect(refund['paymentTransactionId']).to eq(payment['itemTransactions'][0]['paymentTransactionId'])
      expect(refund['price']).to eq(0.2)
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should refund payment with reason and description' do
    # create payment
    payment =  Builder::PaymentBuilder.new.create_standard_listing_payment(@options)

    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        paymentTransactionId: payment['itemTransactions'][0]['paymentTransactionId'],
        price: '0.2',
        currency: Iyzipay::Model::Currency::TRY,
        ip: '85.34.78.112',
        reason: Iyzipay::Model::RefundReason::OTHER,
        description: 'customer requested for default sample'
    }
    refund = Iyzipay::Model::Refund.new.create(request, @options)
    begin
      $stdout.puts refund.inspect
      refund = JSON.parse(refund)
      expect(refund['status']).to eq('success')
      expect(refund['locale']).to eq('tr')
      expect(refund['systemTime']).not_to be_nil
      expect(refund['conversationId']).to eq('123456789')
      expect(refund['paymentId']).to eq(payment['paymentId'])
      expect(refund['paymentTransactionId']).to eq(payment['itemTransactions'][0]['paymentTransactionId'])
      expect(refund['price']).to eq(0.2)
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end