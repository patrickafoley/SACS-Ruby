module Sabre
  module API
    # The City Pairs Lookup API consists of supplemental APIs which retrieve
    # city pairs that can be passed to applicable Air Shopping REST APIs. A city
    # pair is passed as a combination of an origin and destination airport.
    # For example, City Pairs Lookup retrieves the SJU-MIA city pair (San Juan
    # International, Puerto Rico to Miami International). You can pass this city
    # pair for any applicable air search API request, e.g., Lead Price Calendar.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/city_pairs_lookup API Documentation
    # @see Base Base class for documentation
    class CityPairsLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/supported/shop/flights/origins-destinations'
      end
    end
  end
end
