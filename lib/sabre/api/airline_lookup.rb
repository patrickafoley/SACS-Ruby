module Sabre
  module API
    # The Airline Lookup API returns the airline name associated with a
    # specified IATA airline code. If no code is specified, the API returns all
    # codes and their corresponding names.
    # @see https://developer.sabre.com/docs/read/rest_apis/utility/airline_lookup API Documentation
    # @see Base Base class for documentation
    class AirlineLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/utilities/airlines'
      end
    end
  end
end
