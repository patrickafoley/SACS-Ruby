require 'spec_helper'

describe SacsRuby::API::AirlineAllianceLookup do
  it_behaves_like 'base api' do
    let(:opts) do
      {
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/utilities/airlines/'\
          'alliances?',
        token: 'tokentoken'
      }
    end
  end
end
