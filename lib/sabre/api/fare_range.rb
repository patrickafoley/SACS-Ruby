module Sabre
  module API
    # The Fare Range API returns the median, highest, and lowest published fares
    # that were ticketed via the Sabre GDS during the previous 4 weeks for each
    # of the future departure dates in a range, using the specific origin,
    # destination, and length of stay in the request.
    # In the request, future departure dates can range from 0-90 days, from the
    # day of the API request. Length of stay is any single value from 0-16 days.
    # The API also returns a rating of high, medium, or low, which represents
    # the quantity of tickets that the API referenced to obtain the published
    # fare values.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/intelligence/fare_range API Documentation
    # @see Base Base class for documentation
    class FareRange < Sabre::Base
      def required_vars
        %i(origin destination earliestdeparturedate latestdeparturedate
           lengthofstay)
      end

      def endpoint_url
        '/v1/historical/flights/fares'
      end
    end
  end
end
