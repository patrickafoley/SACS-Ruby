module Sabre
  # Base class for POST API
  module BasePost
    def get
      validate!(opts)
      response = Sabre.client.post(request_params)
      @results = JSON.load(response)
    end

    def url
      fail ConfigurationError if Sabre.configuration.nil?
      [Sabre.configuration.environment, endpoint_url].join
    end

    private

    def required_vars
      %i(payload)
    end

    def request_params
      params = { url: url, payload: opts[:payload] }
      params.merge!(token: @token) unless @token.nil?
      params
    end
  end
end
