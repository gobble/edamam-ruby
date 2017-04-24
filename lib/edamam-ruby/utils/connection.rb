module Edamam
  module Utils
    class Connection

      VERB_MAP = {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post,
      }.freeze

      ERROR_MAP = {
        "401" => [UnauthorizedError, "Invalid App Id or App key"],
        "422" => [
          UnprocessableEntityError,
          "Couldn’t parse the recipe or extract the nutritional info",
        ],
        "555" => [
          InsufficientQualityError,
          "Recipe with insufficient quality to process correctly",
        ],
      }.freeze

      def initialize
        uri = URI.parse(Utils::Api::BASE_URL)
        @http = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true
      end

      VERB_MAP.keys.each do |method_name|
        define_method(method_name) do |path, params, header = {}|
          process_request(method_name, path, params, header)
        end
      end

      private

      def process_request(method, path, params, header)
        response = make_request(method, path, params, header)
        raise_error_or_parse_body(response.code, response.body)
      rescue Timeout::Error, SocketError, TypeError => e
        Edamam.log.error e.message
        nil
      end

      def raise_error_or_parse_body(code, body)
        raise ERROR_MAP[code][0], ERROR_MAP[code][1] unless code == "200"
        [code, JSON.parse(body)]
      end

      def make_request(method, path, params = {}, headers = {})
        path = method == :get ? encode_path_params(path, params) : path
        request = VERB_MAP[method.to_sym].new(path)
        request.set_form_data(params) if method == :post
        set_headers(headers)
        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded_path = URI.encode_www_form(params)
        unescaped_encoded_path = [path, encoded_path].join("?").tr("+", " ")
        URI.escape(unescaped_encoded_path)
      end

      def set_headers(headers)
        unless headers.empty?
          headers.each do |key, value|
            request.add_field(key.to_s, value)
          end
        end
      end
    end
  end
end
