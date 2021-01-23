module Iyzipay
  class HttpClient
    def self.get(url, header={})
      RestClient.get(url, header)
    end

    def self.post(url, header, content)
      RestClient.post(url, content, header)
    end

    def self.put(url, header, content)
      RestClient.put(url, content, header)
    end

    def self.delete(url, headers={}, content, &block)
      RestClient::Request.execute(:method => :delete, :url => url, :payload => content, :headers => headers, &block)
    end

    # Those methods to get failed status requests' responses
    def self.get_even_on_error(url, header={})
      RestClient.get(url, header) do |response, request, result|
        {response: response, request: request, result: result}
      end
    end

    def self.post_even_on_error(url, header, content)
      RestClient.post(url, content, header) do |response, request, result|
        {response: response, request: request, result: result}
      end
    end

    def self.put_even_on_error(url, header, content)
      RestClient.put(url, content, header) do |response, request, result|
        {response: response, request: request, result: result}
      end
    end

  end
end
