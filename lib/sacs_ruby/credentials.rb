require 'base64'

module SacsRuby
  # Class for constructing base64 encoded credentials
  class Credentials
    attr_reader :user_id, :group, :domain, :client_secret, :encoded

    def initialize
      fail ConfigurationError if SacsRuby.configuration.nil?
      @user_id = SacsRuby.configuration.user_id
      @group = SacsRuby.configuration.group
      @domain = SacsRuby.configuration.domain
      @client_secret = SacsRuby.configuration.client_secret
      @encoded = encode("#{encoded_client_id}:#{encoded_client_secret}")
    end

    private

    def encode(str)
      Base64.strict_encode64(str)
    end

    def encoded_client_id
      encode(build_client_id)
    end

    def encoded_client_secret
      encode(client_secret)
    end

    def build_client_id
      "V1:#{user_id}:#{group}:#{domain}"
    end
  end
end
