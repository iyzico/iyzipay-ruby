module Iyzipay
  class PkiBuilder
    attr_accessor :request_string

    def initialize(request_string = '')
      @request_string = request_string
    end

    def append_super(super_request_string)
      unless super_request_string.nil?

        s = super_request_string[1..-2]
        if s.length > 0
          result = @request_string + s
          result << ','
        end
        @request_string = result
      end
      self
    end

    def append(key, value = nil)
      unless value.nil?
        append_key_value(key, value)
      end
      self
    end

    def append_price(key, value = nil)
      unless value.nil?
        append_key_value(key, format_price(value))
      end
      self
    end

    def append_array(key, array = nil)
      unless array.nil?
        appended_value = ''
        array.each do |value|
          appended_value << value
          appended_value << ', '
        end
      end
      append_key_value_array(key, appended_value)

      self
    end

    def append_key_value(key, value)
      @request_string = "#{@request_string}#{key}=#{value}," unless value.nil?
    end

    def append_key_value_array(key, value)
      unless value.nil?
        sub = ', '
        value = value.gsub(/[#{sub}]+$/, '')
        @request_string = "#{@request_string}#{key}=[#{value}],"
      end

      self
    end

    def append_prefix
      @request_string = "[#{@request_string}]"
    end

    def remove_trailing_comma
      sub = ','
      @request_string = @request_string.gsub(/[#{sub}]+$/, '')
    end

    def get_request_string
      remove_trailing_comma
      append_prefix

      @request_string
    end

    def format_price(price)
      unless price.include? '.'
        price = price+'.0'
      end
      sub_str_index = 0
      price_reversed = price.reverse
      i=0
      while i < price.size do
        if price_reversed[i] == '0'
          sub_str_index = i + 1
        elsif price_reversed[i] == '.'
          price_reversed = '0' + price_reversed
          break
        else
          break
        end
        i+=1
      end
      (price_reversed[sub_str_index..-1]).reverse
    end

  end
end
