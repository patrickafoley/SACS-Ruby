module Sabre
  module API
    # Bargain Finder Max (BFM), our best-in-class low fare search product, is
    # used to search for the lowest available priced itineraries based upon a
    # travel date. A wide range of user-specified criteria can be applied to
    # the search.
    class BargainFinderMax < Sabre::Base
      include BasePost

      def endpoint_url
        '/v1.9.0/shop/flights?mode=live'
      end
    end
  end
end
