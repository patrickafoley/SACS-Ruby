module SacsRuby
  module API
    # The Bargain Finder Max Alternate Date Shopping API allows you to specify
    # multiple itinerary options and date pair combinations per request.
    class AlternateDate < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v1.9.0/shop/altdates/flights?mode=live'
      end
    end
  end
end
