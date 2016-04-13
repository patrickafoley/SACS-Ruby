require 'spec_helper'

describe Sabre::API::CityPairsLookup do
  it_behaves_like 'base api' do
    let(:opts) do
      {
        pointofsalecountry: 'DE',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/supported/shop/flights/'\
          'origins-destinations?pointofsalecountry=DE',
        token: 'tokentoken'
      }
    end
  end
end
