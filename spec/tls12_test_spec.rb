# coding: utf-8

require_relative 'spec_helper'

RSpec.describe 'Iyzipay' do
  before :all do
    @options = Iyzipay::Options.new
    @options.base_url = 'https://sandbox-api-tls12.iyzipay.com/'
  end

  it 'should test tls 1.2 support' do
    api_test = Iyzipay::Model::ApiTest.new.retrieve(@options)
    begin
      api_test = JSON.parse(api_test)
      expect(api_test['status']).to eq('success')
    rescue
      $stderr.puts 'oops'
      raise
    end
  end
end