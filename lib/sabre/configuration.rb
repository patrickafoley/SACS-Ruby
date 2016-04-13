module Sabre
  # Class for holding configuration
  class Configuration
    attr_accessor :user_id, :group, :domain, :environment, :client_secret,
                  :token_strategy

    def initialize(attrs = {})
      self.attributes = attrs
    end

    def attributes=(attrs = {})
      attrs.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    def auth_base_url
      "#{environment}/v2/auth/token"
    end

    def shared_token?
      token_strategy == :shared
    end
  end
end
