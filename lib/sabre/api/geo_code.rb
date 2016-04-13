module Sabre
  module API
    # The Geo Code API returns the geographic information of a given location.
    class GeoCode < Sabre::Base
      include BasePost

      def endpoint_url
        '/v1/lists/utilities/geocode/locations'
      end
    end
  end
end
