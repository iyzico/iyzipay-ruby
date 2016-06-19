module Iyzipay
  module Model
    class InstallmentDetails
      def self.to_pki_string(request)
        unless request.nil?
          installment_details = Array.new
          request.each do |item|
            item_pki = PkiBuilder.new.
                append(:bankId, item[:bankId]).
                append_array(:installmentPrices, InstallmentPrices.to_pki_string(item[:installmentPrices])).
                get_request_string
            installment_details << item_pki
          end
          installment_details
        end
      end
    end
  end
end
