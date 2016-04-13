module Sabre
  module API
    # The Aircraft Equipment Lookup API returns the aircraft name associated
    # with a specified IATA aircraft equipment code. If no code is specified,
    # the API returns all codes and their corresponding names.
    # @see https://developer.sabre.com/docs/rest_apis/utility/aircraft_equipment_lookup API Documentation
    # @see Base Base class for documentation
    class AircraftEquipmentLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/utilities/aircraft/equipment'
      end
    end
  end
end
