module Iyzipay
  module Model
    class Buyer
      def self.to_pki_string(request)
        unless request.nil?
          PkiBuilder.new.
              append(:id, request[:id]).
              append(:name, request[:name]).
              append(:surname, request[:surname]).
              append(:identityNumber, request[:identityNumber]).
              append(:email, request[:email]).
              append(:gsmNumber, request[:gsmNumber]).
              append(:registrationDate, request[:registrationDate]).
              append(:lastLoginDate, request[:lastLoginDate]).
              append(:registrationAddress, request[:registrationAddress]).
              append(:city, request[:city]).
              append(:country, request[:country]).
              append(:zipCode, request[:zipCode]).
              append(:ip, request[:ip]).
              get_request_string
        end
      end
    end
  end
end
