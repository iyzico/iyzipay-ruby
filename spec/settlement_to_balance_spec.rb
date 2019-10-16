# coding: utf-8
require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = SpecOptions::API_KEY
    @options.secret_key = SpecOptions::SECRET_KEY
    @options.base_url = SpecOptions::BASE_URL
  end

  it 'should make settlement to balance' do
    request = {
        subMerchantKey: 'qGtsC8HgrrJlH3acAcxT0M3ls+U=',
        callbackUrl: 'https://merchantwebsite.com',
        price: '10',
        locale: 'tr',
        conversationId: '123456'
    }
    settlement_to_balance = Iyzipay::Model::SettlementToBalance.new.create(request, @options)
    begin
      $stdout.puts settlement_to_balance.inspect
      puts settlement_to_balance = JSON.parse(settlement_to_balance)
      expect(settlement_to_balance['status']).to eq('success')
      expect(settlement_to_balance['locale']).to eq('tr')
      expect(settlement_to_balance['systemTime']).not_to be_nil
      expect(settlement_to_balance['conversationId']).to eq('123456')
      expect(settlement_to_balance['url']).not_to be_nil
      expect(settlement_to_balance['token']).not_to be_nil
      expect(settlement_to_balance['isSettingsAllTime']).not_to be_nil
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end