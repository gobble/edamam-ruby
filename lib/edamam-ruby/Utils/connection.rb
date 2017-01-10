module Edamam
  module Utils
    class Connection

      VERB_MAP = {
        get: Net::HTTP::Get,
        post: Net::HTTP::Post
      }

      ERROR_MAP = {
        '401' => [UnauthorizedError, 'Invalid App Id or App key'],
        '422' => [
          UnprocessableEntityError,
          'Couldn’t parse the recipe or extract the nutritional info'
        ],
        '555' => [
          InsufficientQualityError,
          'Recipe with insufficient quality to process correctly'
        ]
      }

      def initialize
        uri = URI.parse(Utils::Api::BASE_URL)
        @http = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true
      end

      VERB_MAP.keys.each do |method_name|
        define_method(method_name) do |path, params, header = {}|
          status_code, body = process_request(method_name, path, params, header)
          OpenStruct.new(body.merge(code: status_code))
        end
      end

      private

      def process_request(method, path, params, header)
        response = make_request(method, path, params, header)
        raise_error_or_parse_body(response.code, response.body)
      rescue Timeout::Error, SocketError, TypeError
        nil
      end

      def raise_error_or_parse_body(code, body)
        raise ERROR_MAP[code][0], ERROR_MAP[code][1] unless code == '200'
        [code, JSON.parse(body)]
      end

      def make_request(method, path, params = {}, header = {})
        path = method == :get ? encode_path_params(path, params) : path
        request = VERB_MAP[method.to_sym].new(path)
        request.set_form_data(params) if method == :post
        header.each do |key, value|
          request.add_field(key.to_s, value)
        end unless header.empty?
        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded_path = URI.encode_www_form(params)
        unescaped_encoded_path = [path, encoded_path].join('?').tr('+', ' ')
        URI.escape(unescaped_encoded_path)
      end
    end
  end
end
