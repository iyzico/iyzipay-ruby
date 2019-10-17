module Iyzipay
  module Model
    class SettlementToBalance < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/settlement-to-balance/init", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:subMerchantKey, request[:subMerchantKey]).
            append(:callbackUrl, request[:callbackUrl]).
            append_price(:price, request[:price]).
            get_request_string
      end
    end
  end
end
