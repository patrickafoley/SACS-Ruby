require 'spec_helper'

describe Sabre::Base do
  it_behaves_like 'base api' do
    include_context 'validate options'

    before do
      allow_any_instance_of(described_class)
        .to receive(:required_vars).and_return(%i(origin destination))
      allow_any_instance_of(described_class)
        .to receive(:endpoint_url).and_return('/test')
    end

    let(:opts) do
      {
        origin: 'LAX',
        destination: 'JFK',
        token: 'tokentoken'
      }
    end

    let(:request_params) do
      {
        url: 'https://api.test.sabre.com/test?origin=LAX&destination=JFK',
        token: 'tokentoken'
      }
    end
  end
end
