module Iyzipay
  module Model
    class Address
      def self.to_pki_string(request)
        unless request.nil?
          PkiBuilder.new.
              append(:address, request[:address]).
              append(:zipCode, request[:zipCode]).
              append(:contactName, request[:contactName]).
              append(:city, request[:city]).
              append(:country, request[:country]).
              get_request_string
        end
      end
    end
  end
end
