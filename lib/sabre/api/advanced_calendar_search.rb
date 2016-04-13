module Sabre
  module API
    # The Advanced Calendar Search API returns the lowest published fares and
    # flight itineraries for a given city pair.
    class AdvancedCalendarSearch < Sabre::Base
      include BasePost

      def endpoint_url
        '/v1.9.0/shop/calendar/flights?mode=live'
      end
    end
  end
end
