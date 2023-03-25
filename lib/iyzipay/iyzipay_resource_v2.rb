# frozen_string_literal: true

module Iyzipay
  class IyzipayResourceV2 < IyzipayResource
    AUTHORIZATION_HEADER_STRING = 'IYZWSv2'

    def get_http_header(options, uri, pki_string = nil, authorize_request = true)
      header = {
        accept: 'application/json',
        'content-type': 'application/json'
      }
      if authorize_request
        random_header_value = random_string(RANDOM_STRING_SIZE)
        authorization = prepare_authorization_string(pki_string, random_header_value, options, uri).to_s
        header[:Authorization] = authorization
        header[:'x-iyzi-rnd'] = random_header_value.to_s
        header[:'x-iyzi-client-version'] = 'iyzipay-ruby-1.0.45'
      end

      header
    end

    def prepare_authorization_string(pki_string, random_header_value, options, uri)
      hash_digest = calculate_hash(pki_string, random_header_value, options, uri)
      "#{AUTHORIZATION_HEADER_STRING} #{hash_digest}"
    end

    def calculate_hash(pki_string, random_header_value, options, uri)
      data = "#{random_header_value}#{uri}#{pki_string}"
      signature = OpenSSL::HMAC.hexdigest('SHA256', options.secret_key, data)
      authorization_params = [
        'apiKey:' + options.api_key,
        'randomKey:' + random_header_value,
        'signature:' + signature
      ]
      Base64.strict_encode64(authorization_params.join('&'))
    end
  end
end
