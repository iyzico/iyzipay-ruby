# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://api.iyzipay.com'
  end

  it 'should retrieve payout completed transactions' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        date: '2016-01-22 19:13:00'
    }
    refund = Iyzipay::Model::PayoutCompletedTransactionList.new.retrieve(request, @options)
    begin
      $stderr.puts refund.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should retrieve bounced bank transfers' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        date: '2016-01-22 19:13:00'
    }
    refund = Iyzipay::Model::BouncedBankTransferList.new.retrieve(request, @options)
    begin
      $stderr.puts refund.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end