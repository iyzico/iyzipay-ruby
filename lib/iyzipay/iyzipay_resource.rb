module Iyzipay
  class IyzipayResource

    AUTHORIZATION_HEADER_NAME = 'Authorization'
    RANDOM_HEADER_NAME = 'x-iyzi-rnd';
    AUTHORIZATION_HEADER_STRING = 'IYZWS %s:%s'
    RANDOM_STRING_SIZE = 8
    RANDOM_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'

    def get_http_header(pki_string = nil, options = nil, authorize_request = true)
      header = {:accept => 'application/json',
                :'content-type' => 'application/json'}

      if authorize_request
        random_header_value = random_string(RANDOM_STRING_SIZE)
        header[:'Authorization'] = "#{prepare_authorization_string(pki_string, random_header_value, options)}"
        header[:'x-iyzi-rnd'] = "#{random_header_value}"
      end

      header
    end

    def get_plain_http_header
      get_http_header(nil, false)
    end

    def prepare_authorization_string(pki_string, random_header_value, options)
      hash_digest = calculate_hash(pki_string, random_header_value, options)
      format_header_string(options.api_key, hash_digest)
    end

    def json_decode(response, raw_result)
      json_result = JSON::parse(raw_result)
      response.from_json(json_result)
    end

    def calculate_hash(pki_string, random_header_value, options)
      Digest::SHA1.base64digest("#{options.api_key}#{random_header_value}#{options.secret_key}#{pki_string}")
    end

    def format_header_string(*args)
      sprintf(AUTHORIZATION_HEADER_STRING, *args)
    end

    def random_string(string_length)
      random_string = ''
      string_length.times do
        random_string << RANDOM_CHARS.split('').sample
      end
      random_string
    end

    def to_pki_string(request)
      PkiBuilder.new.append(:locale, request[:locale]).
          append(:conversationId, request[:conversationId]).
          get_request_string
    end
  end
end
