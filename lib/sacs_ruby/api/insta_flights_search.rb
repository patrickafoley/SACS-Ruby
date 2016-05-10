module SacsRuby
  module API
    # The InstaFlights Search API retrieves roundtrip flight itineraries
    # with published fares and fare breakdowns available from the Sabre
    # cache for a certain origin, destination, and roundtrip travel dates.
    # The origins and destinations are airport codes
    class InstaFlightsSearch < SacsRuby::Base
      def required_vars
        %i(origin destination departuredate returndate)
      end

      def endpoint_url
        '/v1/shop/flights'
      end
    end
  end
end
