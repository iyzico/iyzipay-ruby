module Iyzipay
  module Model
    module V2
      class Plan < IyzipayResourceV2
        RESOURCE = '/v2/subscription'

        def create(request, options)
          path = path_for_action('products', request[:productReferenceCode], 'pricing-plans')
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        def update(request, options)
          path = path_for_action('pricing-plans', request[:pricingPlanReferenceCode])
          data = request.to_json
          header = get_http_header(options, path, data)
          HttpClient.post_even_on_error(base_url(options, path), header, data)
        end

        private

        def base_url(options, path)
          "#{options.base_url}#{path}"
        end

        def path_for_action(*args)
          "#{RESOURCE}#{'/' + args.join('/')}"
        end
      end
    end
  end
end
