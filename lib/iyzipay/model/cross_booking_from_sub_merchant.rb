module Iyzipay
  module Model
    class CrossBookingFromSubMerchant < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/crossbooking/receive", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:subMerchantKey, request[:subMerchantKey]).
            append_price(:price, request[:price]).
            append(:reason, request[:reason]).
            append(:currency, request[:currency]).
            get_request_string
      end
    end
  end
end