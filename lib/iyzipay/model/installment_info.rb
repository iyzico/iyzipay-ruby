module Iyzipay
  module Model
    class InstallmentInfo < IyzipayResource

      def retrieve(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/iyzipos/installment", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:binNumber, request[:binNumber]).
            append_price(:price, request[:price]).
            get_request_string
      end
    end
  end
end