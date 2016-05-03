module Iyzipay
  module Model
    class Basket
      def self.to_pki_string(request)
        unless request.nil?
          basket_items = Array.new
          request.each do |item|
            item_pki = PkiBuilder.new.
                append(:id, item[:id]).
                append_price(:price, item[:price]).
                append(:name, item[:name]).
                append(:category1, item[:category1]).
                append(:category2, item[:category2]).
                append(:itemType, item[:itemType]).
                append(:subMerchantKey, item[:subMerchantKey]).
                append_price(:subMerchantPrice, item[:subMerchantPrice]).
                append(:ip, item[:ip]).
                get_request_string
            basket_items << item_pki
          end
          basket_items
        end
      end
    end
  end
end
