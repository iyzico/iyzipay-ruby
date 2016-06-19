# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should initialize bkm express' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentDetails: [isbank_installment_details, finansbank_installment_details, akbank_installment_details, ykb_installment_details, denizbank_installment_details, halkbank_installment_details]
    }
    bkm_initialize = Iyzipay::Model::BasicBkmInitialize.new.create(request, @options)

    begin
      $stderr.puts bkm_initialize.inspect

      bkm_initialize_dict = JSON.parse(bkm_initialize)
      unless bkm_initialize_dict['htmlContent'].nil?
        $stderr.puts Base64.decode64(bkm_initialize_dict['htmlContent']).inspect
      end
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should retrieve bkm express payment' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        token: 'mockToken_1462524972636'
    }
    bkm = Iyzipay::Model::BasicBkm.new.retrieve(request, @options)
    begin
      $stderr.puts bkm.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  def isbank_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 64,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  def finansbank_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 111,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  def akbank_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 46,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  def ykb_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 67,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  def denizbank_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 134,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  def halkbank_installment_details
    single_installment = {
        installmentNumber: 1,
        totalPrice: '1'
    }
    two_installments = {
        installmentNumber: 2,
        totalPrice: '1.1'
    }
    three_installments = {
        installmentNumber: 3,
        totalPrice: '1.1'
    }
    six_installments = {
        installmentNumber: 6,
        totalPrice: '1.2'
    }
    nine_installments = {
        installmentNumber: 9,
        totalPrice: '1.4'
    }
    {
        bankId: 12,
        conversationId: '123456789',
        price: '1.0',
        callbackUrl: 'https://www.merchant.com/callback',
        buyerId: '100',
        buyerEmail: 'john@doe.com',
        buyerIp: '85.34.78.112',
        connectorName: '294-isbank',
        installmentPrices: [single_installment, two_installments, three_installments, six_installments, nine_installments]
    }
  end

  after :each do
  end
end