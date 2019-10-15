module Iyzipay
  module Model
    class RefundToBalance < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/refund-to-balance/init", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:paymentId, request[:paymentId]).
            append(:callbackUrl, request[:callbackUrl]).
            get_request_string
      end
    end
  end
end