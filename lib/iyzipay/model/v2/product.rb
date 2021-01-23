# frozen_string_literal: true

module Iyzipay
  module Model
    module V2
      class Product < IyzipayResourceV2
        RESOURCE = '/v2/subscription/products'

        def list(options)
          header = get_http_header(options, RESOURCE)
          HttpClient.get_even_on_error(base_url(options), header)
        end

        def create(request, options)
          data = request.to_json
          header = get_http_header(options, RESOURCE, data)
          HttpClient.post_even_on_error(base_url(options), header, data)
        end

        def update(request, options)
          data = request.to_json
          path = path_for_action(request[:productReferenceCode])
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        private

        def base_url(options, path = RESOURCE)
          "#{options.base_url}#{path}"
        end

        def path_for_action(*path_args)
          "#{RESOURCE}#{'/' + path_args.join('/')}"
        end
      end
    end
  end
end
