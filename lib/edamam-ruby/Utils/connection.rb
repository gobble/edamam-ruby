module Edamam
  module Utils
    class Connection

      ENDPOINT = Utils::Api::BASE_URL

      VERB_MAP = {
        :get    => Net::HTTP::Get,
        :post   => Net::HTTP::Post
      }

      def initialize(endpoint = ENDPOINT)
        uri = URI.parse(endpoint)
        @http = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true
      end

      VERB_MAP.keys.each do |method_name|
        define_method(method_name) do |path, params, header = {}|
          status_code, body = response_parser method_name, path, params, header
          response = ResponseBuilder.new(code: status_code, body: body)
          response.call
        end
      end

      private

      def response_parser(method, path, params,header)
        response = request(method, path, params,header)
        body = JSON.parse(response.body)
        return response.code, body
      rescue JSON::ParserError, SocketError, TypeError
        response.code
      end

      def request(method, path, params = {},header = {})
        path = method == :get ? encode_path_params(path, params) : path
        request = VERB_MAP[method.to_sym].new(path)
        request.set_form_data(params) if method == :post
        header.each {|key,value| request.add_field(key.to_s, value)} unless header.empty?
        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded_path = URI.encode_www_form(params)
        unescaped_encoded_path = [path, encoded_path].join("?").gsub(/\+/, " ")
        URI.escape(unescaped_encoded_path)
      end
    end

  end
end
