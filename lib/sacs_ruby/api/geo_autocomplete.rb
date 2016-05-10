module SacsRuby
  module API
    # The Geo Autocomplete API returns a list of location predictions
    # for text-based geographic search queries.
    # @see https://developer.sabre.com/docs/rest_apis/utility/geo_autocomplete/ API Documentation
    # @see Base Base class for documentation
    class GeoAutocomplete < SacsRuby::Base
      def required_vars
        %i(query)
      end

      def endpoint_url
        '/v1/lists/utilities/geoservices/autocomplete'
      end
    end
  end
end
