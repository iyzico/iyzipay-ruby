module Iyzipay
  module Model
    class PeccoPayment < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/pecco/auth", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:token, request[:token]).
            get_request_string
      end
    end
  end
end