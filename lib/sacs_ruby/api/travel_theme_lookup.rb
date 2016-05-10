module SacsRuby
  module API
    # The Travel Theme Lookup API returns a list of supported Sabre themes.
    # A theme is similar to a travel category, and is based on geography, points
    # of interest, and recreational activities, such as beaches, national parks,
    # or skiing.
    # @see https://developer.sabre.com/docs/read/rest_apis/air/utility/travel_theme_lookup API Documentation
    # @see Base Base class for documentation
    class TravelThemeLookup < SacsRuby::Base
      def endpoint_url
        '/v1/lists/supported/shop/themes'
      end
    end
  end
end
