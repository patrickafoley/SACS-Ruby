require 'spec_helper'

describe Sabre::API::MultiAirportCityLookup do
  it_behaves_like 'base api' do
    let(:opts) do
      {
        country: 'DE',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/supported/cities?'\
          'country=DE',
        token: 'tokentoken'
      }
    end
  end
end
