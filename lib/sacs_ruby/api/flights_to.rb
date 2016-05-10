module SacsRuby
  module API
    # The Flights To API returns 20 of the lowest published
    # fares available for a given destination.
    # @see https://developer.sabre.com/docs/rest_apis/air/search/flights_to/ API Documentation
    # @see Base Base class for documentation
    class FlightsTo < SacsRuby::Base
      def required_vars
        %i(destination)
      end

      def endpoint_url
        "/v1/shop/flights/cheapest/fares/#{opts.delete(:destination)}"
      end
    end
  end
end
