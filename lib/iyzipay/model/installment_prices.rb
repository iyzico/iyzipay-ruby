module Iyzipay
  module Model
    class InstallmentPrices
      def self.to_pki_string(request)
        unless request.nil?
          installment_prices = Array.new
          request.each do |item|
            item_pki = PkiBuilder.new.
                append(:installmentNumber, item[:installmentNumber]).
                append_price(:totalPrice, item[:totalPrice]).
                get_request_string
            installment_prices << item_pki
          end
          installment_prices
        end
      end
    end
  end
end
