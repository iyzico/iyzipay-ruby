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

  it 'should make settlement to balance' do
    sub_merchant = Builder::SubMerchantBuilder.new.create_personal_sub_merchant(@options)
    request = {
        subMerchantKey: sub_merchant['subMerchantKey'],
        callbackUrl: 'https://merchantwebsite.com',
        price: '10',
        locale: 'tr',
        conversationId: '123456'
    }
    settlement_to_balance = Iyzipay::Model::SettlementToBalance.new.create(request, @options)
    begin
      $stdout.puts settlement_to_balance.inspect
      expect(settlement_to_balance['status']).not_to be_nil
      expect(settlement_to_balance['locale']).not_to be_nil
      expect(settlement_to_balance['systemTime']).not_to be_nil
      expect(settlement_to_balance['conversationId']).not_to be_nil
      expect(settlement_to_balance['url']).not_to be_nil
      expect(settlement_to_balance['token']).not_to be_nil
      expect(settlement_to_balance['settingsAllTime']).not_to be_nil
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end
