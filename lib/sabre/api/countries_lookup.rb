module Sabre
  module API
    # The Countries Lookup API retrieves a list of origin and destination
    # countries. These countries can be used as a filter in applicable
    # REST APIs. This API is point of sale specific (each point of sale
    # supports a unique list of origin and destination countries).
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/countries_lookup API Documentation
    # @see Base Base class for documentation
    class CountriesLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/supported/countries'
      end
    end
  end
end
