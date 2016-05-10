module SacsRuby
  # Base class for API
  class Base
    attr_reader :opts, :token, :results, :url

    def self.get(*args)
      new(*args).get
    end

    def initialize(opts = {})
      @token = opts.delete(:token)
      @opts = opts
    end

    def get
      validate!(opts)
      response = SacsRuby.client.get(request_params)
      @results = JSON.load(response)
    end

    def valid?
      return true unless self.respond_to? :required_vars
      @missing_opts = required_vars - opts.keys
      @missing_opts.empty?
    end

    def url
      fail ApiEndpointError, 'Missing endpoint url' unless self.respond_to? :endpoint_url
      fail ConfigurationError if SacsRuby.configuration.nil?
      [SacsRuby.configuration.environment, endpoint_url, '?', build_query].join
    end

    private

    def validate!(opts)
      fail ApiArgumentError, "Missing required params: #{@missing_opts.join(' ')}" unless valid?
    end

    def build_query
      opts.map { |k, v| "#{k}=#{v}" }.join('&')
    end

    def request_params
      @token.nil? ? { url: url } : { url: url, token: @token }
    end
  end
end
