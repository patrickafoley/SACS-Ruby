module SacsRuby
  module API
    # The Airline Alliance Lookup API returns the airline alliance member
    # information associated with a specified airline alliance group code.
    # If no code is specified, the API returns all airline alliance groups and
    # their corresponding member information.
    # @see https://developer.sabre.com/docs/rest_apis/utility/airline_alliance_lookup API Documentation
    # @see Base Base class for documentation
    class AirlineAllianceLookup < SacsRuby::Base
      def endpoint_url
        '/v1/lists/utilities/airlines/alliances'
      end
    end
  end
end
