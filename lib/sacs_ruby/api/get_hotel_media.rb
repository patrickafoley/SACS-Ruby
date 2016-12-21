module SacsRuby
  module API
    class GetHotelMedia < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v1.0.0/shop/hotels/media'
      end
    end
  end
end
