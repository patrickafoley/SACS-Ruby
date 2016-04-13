require 'spec_helper'

describe Sabre::API::TopDestinations do
  it_behaves_like 'base api' do
    let(:opts) do
      {
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/top/destinations?',
        token: 'tokentoken'
      }
    end
  end
end
