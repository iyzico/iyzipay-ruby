module Iyzipay
  module Model
    class BasicPayment < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/iyziconnect/auth", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append_price(:price, request[:price]).
            append_price(:paidPrice, request[:paidPrice]).
            append(:installment, request[:installment]).
            append(:buyerEmail, request[:buyerEmail]).
            append(:buyerId, request[:buyerId]).
            append(:buyerIp, request[:buyerIp]).
            append(:posOrderId, request[:posOrderId]).
            append(:paymentCard, PaymentCard.to_pki_string(request[:paymentCard])).
            append(:currency, request[:currency]).
            append(:connectorName, request[:connectorName]).
            append(:callbackUrl, request[:callbackUrl]).
            get_request_string
      end
    end
  end
end