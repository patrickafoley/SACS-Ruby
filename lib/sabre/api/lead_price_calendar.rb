module Sabre
  module API
    # The Lead Price Calendar API returns the lowest published fares each of
    # the next 192 calendar days for a given city pair.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/search/lead_price_calendar API Documentation
    # @see Base Base class for documentation
    class LeadPriceCalendar < Sabre::Base
      def required_vars
        %i(origin destination lengthofstay)
      end

      def endpoint_url
        '/v2/shop/flights/fares'
      end
    end
  end
end
