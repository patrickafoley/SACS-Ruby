module SacsRuby
  module API
    # The Seat Map API returns real-time seat map and specific seat pricing
    # and availability information for a given aircraft.
    class SeatMap < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v3.0.0/book/flights/seatmaps?mode=live'
      end
    end
  end
end
