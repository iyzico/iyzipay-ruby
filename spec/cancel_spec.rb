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

  it 'should cancel payment' do
    payment = Builder::PaymentBuilder.new.create_standard_listing_payment(@options)

    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        paymentId: payment['paymentId'],
        ip: '85.34.78.112'
    }
    cancel = Iyzipay::Model::Cancel.new.create(request, @options)
    begin
      $stdout.puts cancel.inspect
      cancel = JSON.parse(cancel)
      expect(cancel['status']).to eq('success')
      expect(cancel['locale']).to eq('tr')
      expect(cancel['systemTime']).not_to be_nil
      expect(cancel['conversationId']).to eq('123456789')
      expect(cancel['paymentId']).to eq(payment['paymentId'])
      expect(cancel['price']).to eq(1.10000000)
      expect(cancel['currency']).to eq('TRY')
      expect(cancel['authCode']).not_to be_nil
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should cancel payment with reason and description' do
    payment = Builder::PaymentBuilder.new.create_standard_listing_payment(@options)

    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        paymentId: payment['paymentId'],
        ip: '85.34.78.112',
        reason: Iyzipay::Model::RefundReason::OTHER,
        description: 'customer requested for default sample'
    }
    cancel = Iyzipay::Model::Cancel.new.create(request, @options)
    begin
      $stdout.puts cancel.inspect
      cancel = JSON.parse(cancel)
      expect(cancel['status']).to eq('success')
      expect(cancel['locale']).to eq('tr')
      expect(cancel['systemTime']).not_to be_nil
      expect(cancel['conversationId']).to eq('123456789')
      expect(cancel['paymentId']).to eq(payment['paymentId'])
      expect(cancel['price']).to eq(1.10000000)
      expect(cancel['currency']).to eq('TRY')
      expect(cancel['authCode']).not_to be_nil
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end