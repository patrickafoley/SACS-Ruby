require 'spec_helper'

describe SacsRuby::API::FlightsTo do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        destination: 'LAX',
        pointofsalecountry: 'DE',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/shop/flights/cheapest/fares/LAX?pointofsalecountry=DE',
        token: 'tokentoken'
      }
    end
  end
end
