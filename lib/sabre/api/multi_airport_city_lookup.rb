module Sabre
  module API
    # The Multi-Airport City Lookup API returns a list of multi-airport city
    # (MAC) codes. The response contains multi-airport cities located in the
    # requested country(s), sorted by city name, in ascending rank order. If no
    # country is specified, then all MAC codes and cities are returned. An
    # example multi-airport city code is CHI, and the corresponding city name is
    # Chicago. Note: Some city codes represent a metropolitan area that
    # contains more than one major city. For example, the MAC code "QDF"
    # represents Dallas and Ft. Worth, Texas. In this case, the city name is
    # "Dallas / Ft. Worth".
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/multiairport_city_lookup API Documentation
    # @see Base Base class for documentation
    class MultiAirportCityLookup < Sabre::Base
      def endpoint_url
        '/v1/lists/supported/cities'
      end
    end
  end
end
