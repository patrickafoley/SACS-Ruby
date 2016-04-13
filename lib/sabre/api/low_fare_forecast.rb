module Sabre
  module API
    # The Low Fare Forecast API forecasts the price range into which the
    # lowest published fare that is available via the Sabre GDS is predicted
    # to fall within the next 7 days, for a specific origin and destination on
    # specific roundtrip travel dates.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/intelligence/low_fare_forecast API Documentation
    # @see Base Base class for documentation
    class LowFareForecast < Sabre::Base
      def required_vars
        %i(origin destination departuredate returndate)
      end

      def endpoint_url
        '/v1/forecast/flights/fares'
      end
    end
  end
end
