require 'spec_helper'

describe SacsRuby::API::AlternateAirportShop do
  it_behaves_like 'base api' do
    include_context 'post method'

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1.9.0/shop/altairports/flights?mode=live',
        token: 'tokentoken',
        payload: json_payload
      }
    end
  end
end
