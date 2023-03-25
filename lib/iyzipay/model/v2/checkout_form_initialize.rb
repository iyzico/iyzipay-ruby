module Iyzipay
  module Model
    module V2
      class CheckoutFormInitialize < IyzipayResourceV2
        RESOURCE = '/v2/subscription/checkoutform/initialize'

        def create(request, options)
          data = request.to_json
          header = get_http_header(options, RESOURCE, data)
          HttpClient.post_even_on_error(base_url(options), header, data)
        end

        private

        def base_url(options)
          "#{options.base_url}#{RESOURCE}"
        end
      end
    end
  end
end