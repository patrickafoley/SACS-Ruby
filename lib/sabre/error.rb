module Sabre
  # Error implementation
  class Error < StandardError
    def initialize(response)
      @response = response
    end

    def error
      @error = @response['type']
    end

    def description
      @description = @response['message']
    end

    def to_s
      "error='#{error}' description='#{description}'"
    end
  end

  # 404 HTTP Error
  class NotFoundError < Error
    def initialize(response)
      if response.nil?
        @response = { 'type' => 'Not Found', 'message' => '404 Not Found' }
      else
        super
      end
    end
  end

  class BadRequestError < Error; end
  class AuthorizationError < Error; end
  class ClientRequestError < Error; end
  class TooManyRequestsError < Error; end
  class JsonSchemaError < Error; end

  # Token Authentication Error
  class TokenRequestError < Error
    def initialize(response)
      @response = {
        'type' => response['error'],
        'message' => response['error_description']
      }
    end
  end

  class ApiArgumentError < StandardError; end
  class ApiEndpointError < StandardError; end
  class ConfigurationError < StandardError
    def to_s
      'Missing configuration. Please initialize it before use.'
    end
  end
end
