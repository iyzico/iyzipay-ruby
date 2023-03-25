module Iyzipay
  module Model
    module V2
      class CheckoutForm < IyzipayResourceV2
        RESOURCE = '/v2/subscription/checkoutform'

        def retrieve(request, options)
            header = get_http_header(options, "#{RESOURCE}/#{request[:token]}")
            HttpClient.get_even_on_error(base_url(options, request[:token]), header)
        end

        private

        def base_url(options, token)
          "#{options.base_url}#{RESOURCE}/#{token}"
        end
      end
    end
  end
end
