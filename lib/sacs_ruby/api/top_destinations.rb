module SacsRuby
  module API
    # The Top Destinations API retrieves top booked leisure destinations from a
    # given origin and returns them in ascending rank order.
    # The API looks up the traffic volume booked via the Sabre GDS to the top
    # destinations for the previous 2, 8 or 12 weeks. It returns up to 50
    # results per origin by rank - rank one is most popular; whereas, rank 50
    # is least popular. Origin can be a multi-airport city (MAC) code, airport
    # code, country code, or all possible origins (domestic and international)
    # combined.
    # @see https://developer.sabre.com/docs/rest_apis/air/search/flights_to/ API Documentation
    # @see Base Base class for documentation
    class TopDestinations < SacsRuby::Base
      def endpoint_url
        '/v1/lists/top/destinations'
      end
    end
  end
end
