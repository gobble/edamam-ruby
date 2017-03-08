module Edamam
  module Utils
    class MissingKeyError < StandardError
    end

    class UnauthorizedError < StandardError
    end

    class UnprocessableEntityError < StandardError
    end

    class InsufficientQualityError < StandardError
    end
  end
end
