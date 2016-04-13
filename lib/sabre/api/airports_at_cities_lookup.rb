module Sabre
  module API
    # The Airports at Cities Lookup API returns the major airport, rail station
    # and other codes that are associated with a single a multi-airport city
    # (MAC) code. An example multi-airport city code is CHI, and the
    # corresponding city name is Chicago.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/airports_at_cities_lookup API Documentation
    # @see Base Base class for documentation
    class AirportsAtCitiesLookup < Sabre::Base
      def required_vars
        %i(city)
      end

      def endpoint_url
        "/v1/lists/supported/cities/#{opts.delete(:city)}/airports"
      end
    end
  end
end
