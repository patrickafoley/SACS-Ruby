module SacsRuby
  module API
    # The Geo Search API returns a list of places around a given location.
    class GeoSearch < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v1.0.0/lists/utilities/geosearch/locations?mode=geosearch'
      end
    end
  end
end
