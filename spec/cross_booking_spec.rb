# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://api.iyzipay.com'
  end

  it 'should send money to sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantKey: 'sub merchant key',
        price: '1.0',
        reason: 'reason text',
    }
    cross_booking = Iyzipay::Model::CrossBookingToSubMerchant.new.create(request, @options)
    begin
      $stderr.puts cross_booking.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should receive money from sub merchant' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        subMerchantKey: 'sub merchant key',
        price: '1.0',
        reason: 'reason text',
    }
    cross_booking = Iyzipay::Model::CrossBookingFromSubMerchant.new.create(request, @options)
    begin
      $stderr.puts cross_booking.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end