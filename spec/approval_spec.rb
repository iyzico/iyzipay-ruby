# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.api_key = 'your api key'
    @options.secret_key = 'your secret key'
    @options.base_url = 'https://api.iyzipay.com'
  end

  it 'should approve payment item' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        paymentTransactionId: '699'
    }
    approval = Iyzipay::Model::Approval.new.create(request, @options)
    begin
      $stderr.puts approval.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  it 'should disapprove payment item' do
    request = {
        locale: 'tr',
        conversationId: '123456789',
        paymentTransactionId: '699'
    }
    disapproval = Iyzipay::Model::Disapproval.new.create(request, @options)
    begin
      $stderr.puts disapproval.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end

  after :each do
  end
end