require 'spec_helper'

describe Sabre::API::InstaFlightsSearch do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        origin: 'LAX',
        destination: 'JFK',
        departuredate: '2015-12-01',
        returndate: '2015-12-03',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/shop/flights?origin=LAX&destination=JFK&departuredate=2015-12-01&returndate=2015-12-03',
        token: 'tokentoken'
      }
    end
  end
end
