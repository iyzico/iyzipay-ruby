module Iyzipay
  module Model
    class BasicPaymentPostAuth < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/iyziconnect/postauth", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:paymentId, request[:paymentId]).
            append(:ip, request[:ip]).
            append_price(:paidPrice, request[:paidPrice]).
            append(:currency, request[:currency]).
            get_request_string
      end
    end
  end
end