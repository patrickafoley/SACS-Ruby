module Sabre
  module API
    # The Travel Seasonality API returns a traffic volume rating for each week
    # of the year for a given destination.
    # In total, each request returns a booked traffic volume rating of low,
    # medium or high for each week (1-52) of the next year for a given
    # destination. Each week is compared with the traffic volume of the other 51
    # weeks. The API then calculates whether that week is high or low
    # seasonality, e.g., week 32 is compared with the 1st, 2nd, 3rd … 33rd,
    # 34th, 35th… 52nd weeks.
    # @see https://developer.sabre.com/docs/rest_apis/air/search/flights_to/ API Documentation
    # @see Base Base class for documentation
    class TravelSeasonality < Sabre::Base
      def required_vars
        %i(destination)
      end

      def endpoint_url
        "/v1/historical/flights/#{opts.delete(:destination)}/seasonality"
      end
    end
  end
end
