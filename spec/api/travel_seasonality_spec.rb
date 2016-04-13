require 'spec_helper'

describe Sabre::API::TravelSeasonality do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        destination: 'LAX',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/historical/flights/LAX/'\
          'seasonality?',
        token: 'tokentoken'
      }
    end
  end
end
