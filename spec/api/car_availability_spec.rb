require 'spec_helper'

describe SacsRuby::API::CarAvailability do
  it_behaves_like 'base api' do
    include_context 'post method'

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v2.4.0/shop/cars',
        token: 'tokentoken',
        payload: json_payload
      }
    end
  end
end
