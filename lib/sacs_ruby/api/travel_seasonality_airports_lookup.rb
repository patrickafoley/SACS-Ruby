module SacsRuby
  module API
    # The Travel Seasonality Airports Lookup API retrieves a list of our
    # supported destinations.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/travel_seasonality_airports_lookup API Documentation
    # @see Base Base class for documentation
    class TravelSeasonalityAirportsLookup < SacsRuby::Base
      def endpoint_url
        '/v1/lists/supported/historical/seasonality/airports'
      end
    end
  end
end
