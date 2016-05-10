require 'spec_helper'

describe SacsRuby::API::LeadPriceCalendar do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        origin: 'LAX',
        destination: 'JFK',
        lengthofstay: 2,
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v2/shop/flights/fares?origin=LAX&destination=JFK&lengthofstay=2',
        token: 'tokentoken'
      }
    end
  end
end
