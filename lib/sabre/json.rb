require 'multi_json'

module Sabre
  module JSON
    extend self

    def dump(object, adapter_options = {})
      MultiJson.dump(object, adapter_options)
    end

    def load(string, adapter_options = {})
      return nil if string.empty?
      MultiJson.load(string, adapter_options)
    end
  end
end