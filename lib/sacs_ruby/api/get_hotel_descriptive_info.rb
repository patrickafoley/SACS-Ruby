module SacsRuby
  module API
    class GetHotelDescriptiveInfo < SacsRuby::Base
      include BasePost

      def endpoint_url
        '/v1.0.0/shop/hotels/description?mode=description'
      end
    end
  end
end
