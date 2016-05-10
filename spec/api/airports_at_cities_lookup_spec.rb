require 'spec_helper'

describe SacsRuby::API::AirportsAtCitiesLookup do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        city: 'LON',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/supported/cities/LON/'\
          'airports?',
        token: 'tokentoken'
      }
    end
  end
end
