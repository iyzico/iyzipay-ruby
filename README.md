# iyzipay-ruby

[![Build Status](https://travis-ci.org/iyzico/iyzipay-ruby.svg?branch=master)](https://travis-ci.org/iyzico/iyzipay-ruby)

You can sign up for an iyzico account at https://iyzico.com

# Requirements

* Ruby 2.1 or newer
* rest-client

## Note

Ruby 1.9.3 will not be supported in March 2018 for TLS 1.2 migration. Please upgrade your Ruby version to minimum 2.1.0. If you have any questions, please open an issue on Github or contact us at integration@iyzico.com.

# Installation

    gem install iyzipay

## Bundler

``` ruby
source 'https://rubygems.org'

gem 'iyzipay'

```

# Usage

```ruby

before :all do
  @options = Iyzipay::Options.new
  @options.api_key = 'your api key'
  @options.secret_key = 'your secret key'
  @options.base_url = 'https://sandbox-api.iyzipay.com'
end

it 'should create payment' do
    payment_card = {
        cardHolderName: 'John Doe',
        cardNumber: '5528790000000008',
        expireYear: '2030',
        expireMonth: '12',
        cvc: '123',
        registerCard: 0
    }
    buyer = {
        id: 'BY789',
        name: 'John',
        surname: 'Doe',
        identityNumber: '74300864791',
        email: 'email@email.com',
        gsmNumber: '+905350000000',
        registrationDate: '2013-04-21 15:12:09',
        lastLoginDate: '2015-10-05 12:43:35',
        registrationAddress: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        city: 'Istanbul',
        country: 'Turkey',
        zipCode: '34732',
        ip: '85.34.78.112'
    }
    address = {
        address: 'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
        zipCode: '34732',
        contactName: 'John Doe',
        city: 'Istanbul',
        country: 'Turkey'
    }

    item1 = {
        id: 'BI101',
        name: 'Binocular',
        category1: 'Collectibles',
        category2: 'Accessories',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.3'
    }
    item2 = {
        id: 'BI102',
        name: 'Game code',
        category1: 'Game',
        category2: 'Online Game Items',
        itemType: Iyzipay::Model::BasketItemType::VIRTUAL,
        price: '0.5'
    }
    item3 = {
        id: 'BI103',
        name: 'Usb',
        category1: 'Electronics',
        category2: 'Usb / Cable',
        itemType: Iyzipay::Model::BasketItemType::PHYSICAL,
        price: '0.2'
    }
    request = {
        locale: Iyzipay::Model::Locale::TR,
        conversationId: '123456789',
        price: '1.0',
        paidPrice: '1.1',
        installment: 1,
        paymentChannel: Iyzipay::Model::PaymentChannel::WEB,
        basketId: 'B67832',
        paymentGroup: Iyzipay::Model::PaymentGroup::SUBSCRIPTION,
        currency: Iyzipay::Model::Currency::TRY,
        paymentCard: payment_card,
        buyer: buyer,
        billingAddress: address,
        shippingAddress: address,
        basketItems: [item1, item2, item3]
    }
    payment = Iyzipay::Model::Payment.new.create(request, @options)
    begin
      $stderr.puts payment.inspect
    rescue
      $stderr.puts 'oops'
      raise
    end
  end
```
See other samples under iyzipay-ruby/spec module.

Testing
=======

You can run specs with RSpec under spec module.

### Mock test cards

Test cards that can be used to simulate a *successful* payment:

Card Number      | Bank                       | Card Type
-----------      | ----                       | ---------
5890040000000016 | Akbank                     | Master Card (Debit)
5526080000000006 | Akbank                     | Master Card (Credit)
4766620000000001 | Denizbank                  | Visa (Debit)
4603450000000000 | Denizbank                  | Visa (Credit)
4729150000000005 | Denizbank Bonus            | Visa (Credit)
4987490000000002 | Finansbank                 | Visa (Debit)
5311570000000005 | Finansbank                 | Master Card (Credit)
9792020000000001 | Finansbank                 | Troy (Debit)
9792030000000000 | Finansbank                 | Troy (Credit)
5170410000000004 | Garanti Bankası            | Master Card (Debit)
5400360000000003 | Garanti Bankası            | Master Card (Credit)
374427000000003  | Garanti Bankası            | American Express
4475050000000003 | Halkbank                   | Visa (Debit)
5528790000000008 | Halkbank                   | Master Card (Credit)
4059030000000009 | HSBC Bank                  | Visa (Debit)
5504720000000003 | HSBC Bank                  | Master Card (Credit)
5892830000000000 | Türkiye İş Bankası         | Master Card (Debit)
4543590000000006 | Türkiye İş Bankası         | Visa (Credit)
4910050000000006 | Vakıfbank                  | Visa (Debit)
4157920000000002 | Vakıfbank                  | Visa (Credit)
5168880000000002 | Yapı ve Kredi Bankası      | Master Card (Debit)
5451030000000000 | Yapı ve Kredi Bankası      | Master Card (Credit)

*Cross border* test cards:

Card Number      | Country
-----------      | -------
4054180000000007 | Non-Turkish (Debit)
5400010000000004 | Non-Turkish (Credit)

Test cards to get specific *error* codes:

Card Number       | Description
-----------       | -----------
5406670000000009  | Success but cannot be cancelled, refund or post auth
4111111111111129  | Not sufficient funds
4129111111111111  | Do not honour
4128111111111112  | Invalid transaction
4127111111111113  | Lost card
4126111111111114  | Stolen card
4125111111111115  | Expired card
4124111111111116  | Invalid cvc2
4123111111111117  | Not permitted to card holder
4122111111111118  | Not permitted to terminal
4121111111111119  | Fraud suspect
4120111111111110  | Pickup card
4130111111111118  | General error
4131111111111117  | Success but mdStatus is 0
4141111111111115  | Success but mdStatus is 4
4151111111111112  | 3dsecure initialize failed
