module Sabre
  module API
    # The Low Fare History API returns each day of the past two weeks
    # lowest published fares for a given city/date pair.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/intelligence/low_fare_history API Documentation
    # @see Base Base class for documentation
    class LowFareHistory < Sabre::Base
      def required_vars
        %i(origin destination departuredate returndate)
      end

      def endpoint_url
        '/v1/historical/shop/flights/fares'
      end
    end
  end
end
