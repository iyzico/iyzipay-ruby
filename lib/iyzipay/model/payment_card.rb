module Iyzipay
  module Model
    class PaymentCard
      def self.to_pki_string(request)
        unless request.nil?
          PkiBuilder.new.
              append(:cardHolderName, request[:cardHolderName]).
              append(:cardNumber, request[:cardNumber]).
              append(:expireYear, request[:expireYear]).
              append(:expireMonth, request[:expireMonth]).
              append(:cvc, request[:cvc]).
              append(:registerCard, request[:registerCard]).
              append(:cardAlias, request[:cardAlias]).
              append(:cardToken, request[:cardToken]).
              append(:cardUserKey, request[:cardUserKey]).
              get_request_string
        end
      end
    end
  end
end

