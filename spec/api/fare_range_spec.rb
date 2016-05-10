require 'spec_helper'

describe SacsRuby::API::FareRange do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        origin: 'LAX',
        destination: 'JFK',
        earliestdeparturedate: '2015-10-31',
        latestdeparturedate: '2015-10-31',
        lengthofstay: 2,
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/historical/flights/fares?'\
          'origin=LAX&destination=JFK&earliestdeparturedate=2015-10-31&'\
          'latestdeparturedate=2015-10-31&lengthofstay=2',
        token: 'tokentoken'
      }
    end
  end
end
