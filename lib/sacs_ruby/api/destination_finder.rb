module SacsRuby
  module API
    # The Destination Finder API returns the lowest published fares
    # available to destinations from a given origin.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/search/destination_finder API Documentation
    # @see Base Base class for documentation
    class DestinationFinder < SacsRuby::Base
      def required_vars
        %i( origin )
      end

      def endpoint_url
        '/v2/shop/flights/fares'
      end
    end
  end
end
