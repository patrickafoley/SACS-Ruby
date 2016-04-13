require 'spec_helper'

describe Sabre::API::AirlineLookup do
  it_behaves_like 'base api' do
    let(:opts) do
      {
        airlinecode: 'AI',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/utilities/airlines'\
          '?airlinecode=AI',
        token: 'tokentoken'
      }
    end
  end
end
