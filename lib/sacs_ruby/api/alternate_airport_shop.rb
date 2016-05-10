module SacsRuby
  module API
    # The Alternate Airport Shop API allows you to define up to 20 airports per
    # origin and/or destination. The API returns the lead fare (either nonstop
    # or overall, whichever is lowest) with the corresponding flight itinerary
    # and fare breakdown for each lead fare.
    class AlternateAirportShop < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v1.9.0/shop/altairports/flights?mode=live'
      end
    end
  end
end
