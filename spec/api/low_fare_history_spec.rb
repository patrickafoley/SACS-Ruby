require 'spec_helper'

describe SacsRuby::API::LowFareHistory do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        origin: 'LAX',
        destination: 'JFK',
        departuredate: '2015-12-01',
        returndate: '2015-12-03',
        pointofsalecountry: 'DE',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/historical/shop/flights/fares'\
          '?origin=LAX&destination=JFK&departuredate=2015-12-01&'\
          'returndate=2015-12-03&pointofsalecountry=DE',
        token: 'tokentoken'
      }
    end
  end
end
