# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://sandbox-api.iyzipay.com'
  end

  it 'should create personal sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'B49224',
        subMerchantType: Iyzipay::Model::SubMerchantType::PERSONAL,
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        contactName: 'John',
        contactSurname: 'Doe',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'John\'s market',
        iban: 'TR180006200119000006672315',
        identityNumber: '1234567890',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.create(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should create private sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'S49222',
        subMerchantType: Iyzipay::Model::SubMerchantType::PRIVATE_COMPANY,
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        taxOffice: 'Tax office',
        legalCompanyTitle: 'John Doe inc',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'John\'s market',
        iban: 'TR180006200119000006672315',
        identityNumber: '31300864726',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.create(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should create limited company sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'AS49224',
        subMerchantType: Iyzipay::Model::SubMerchantType::LIMITED_OR_JOINT_STOCK_COMPANY,
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        taxOffice: 'Tax office',
        taxNumber: '9261877',
        legalCompanyTitle: 'XYZ inc',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'John\'s market',
        iban: 'TR180006200119000006672315',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.create(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should update personal sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'B49224',
        subMerchantKey: 'sub merchant key',
        iban: 'TR180006200119000006672315',
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        contactName: 'Jane',
        contactSurname: 'Doe',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'Jane\'s market',
        identityNumber: '31300864726',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.update(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should update private sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'S49222',
        subMerchantKey: 'sub merchant key',
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        taxOffice: 'Tax office',
        legalCompanyTitle: 'Jane Doe inc',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'Jane\'s market',
        iban: 'TR180006200119000006672315',
        identityNumber: '31300864726',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.update(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should update limited company sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'AS49224',
        subMerchantKey: 'sub merchant key',
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        taxOffice: 'Tax office',
        taxNumber: '9261877',
        legalCompanyTitle: 'ABC inc',
        email: 'email@submerchantemail.com',
        gsmNumber: '+905350000000',
        name: 'Jane\'s market',
        iban: 'TR180006200119000006672315',
        currency: Iyzipay::Model::Currency::TRY
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.update(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should retrieve sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantExternalId: 'AS49224'
    }
    sub_merchant = Iyzipay::Model::SubMerchant.new.retrieve(request, @options)
    begin
      $stderr.puts sub_merchant.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end