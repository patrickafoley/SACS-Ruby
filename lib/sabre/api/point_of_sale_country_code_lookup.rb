module Sabre
  module API
    # Point of Sale Country Code Lookup is a supplemental API that retrieves a
    # list of supported point of sale country codes and associated country
    # names. The country codes can be passed as a parameter in certain REST API
    # requests (those which support a 'pointofsalecountry' parameter). When a
    # point of sale country is submitted with the request, only data related to
    # that point of sale will be included in the response.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/point_of_sale_country_code_lookup API Documentation
    # @see Base Base class for documentation
    class PointOfSaleCountryCodeLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/supported/pointofsalecountries'
      end
    end
  end
end
