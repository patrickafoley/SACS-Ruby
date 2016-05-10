require 'spec_helper'

describe SacsRuby::API::SeatMap do
  it_behaves_like 'base api' do
    include_context 'post method'

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/v3.0.0/book/flights/seatmaps?mode=live',
        token: 'tokentoken',
        payload: json_payload
      }
    end
  end
end
