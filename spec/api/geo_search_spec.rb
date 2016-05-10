require 'spec_helper'

describe SacsRuby::API::GeoSearch do
  it_behaves_like 'base api' do
    include_context 'post method'

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v1/lists/utilities/geosearch/locations',
        token: 'tokentoken',
        payload: json_payload
      }
    end
  end
end
