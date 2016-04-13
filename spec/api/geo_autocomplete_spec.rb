require 'spec_helper'

describe Sabre::API::GeoAutocomplete do
  it_behaves_like 'base api' do
    include_context 'validate options'

    let(:opts) do
      {
        query: 'Dall',
        category: 'AIR',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/utilities/geoservices/'\
          'autocomplete?query=Dall&category=AIR',
        token: 'tokentoken'
      }
    end
  end
end
