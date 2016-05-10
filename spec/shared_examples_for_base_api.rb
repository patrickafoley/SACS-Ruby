RSpec.shared_examples 'base api' do
  let(:payload) do
    JSON.dump(
      sample: 'json'
    )
  end

  let(:http_method) { :get }
  let(:parsed_opts) { opts.delete_if { |k, _| k == :token } }
  let(:invalid_opts) { { pointofsalecountry: 'DE' } }
  let(:json_payload) do
    JSON.dump(
      'TravelPreferences' => {
        'TPA_Extensions' => {
          'NumTrips' => {
            'Number' => 1
          }
        }
      })
  end

  describe '#initialize' do
    subject { described_class.new(opts) }

    it 'sets token' do
      expect(subject.token).to eq('tokentoken')
    end

    it 'sets opts' do
      expect(subject.opts).to eq(parsed_opts)
    end
  end

  describe '.valid?' do
    subject { described_class.new(opts).valid? }

    it 'params are valid' do
      expect(subject).to be_truthy
    end
  end

  describe '.get' do
    subject { described_class.new(opts).get }

    context 'with params and token' do
      it 'gets valid response' do
        allow(SacsRuby.client).to receive(http_method)
          .with(request_params)
          .and_return(payload)

        expect(subject).to eq('sample' => 'json')
        expect(subject).to be_a(Hash)
      end
    end

    context 'without token' do
      it 'gets valid response' do
        opts.delete(:token)
        request_params.delete(:token)
        allow(SacsRuby.client).to receive(http_method)
          .with(request_params)
          .and_return(payload)

        expect(subject).to eq('sample' => 'json')
        expect(subject).to be_a(Hash)
      end
    end
  end

  describe 'results' do
    subject { described_class.new(opts) }

    it 'gets valid response' do
      allow(SacsRuby.client).to receive(http_method)
        .with(request_params)
        .and_return(payload)

      subject.get

      expect(subject.results).to eq('sample' => 'json')
      expect(subject).to be_a(described_class)
    end
  end

  describe '#get' do
    subject { described_class.get(opts) }

    it 'returns parsed json' do
      allow(SacsRuby.client).to receive(http_method)
        .with(request_params)
        .and_return(payload)

      expect(subject).to eq('sample' => 'json')
      expect(subject).to be_a(Hash)
    end
  end
end

RSpec.shared_context 'validate options' do
  describe '.get' do
    subject { described_class.new(opts).get }

    context 'with missing params' do
      subject { described_class.new(invalid_opts).get }

      it 'raises validate error' do
        expect { subject }
          .to raise_error(SacsRuby::ApiArgumentError)
      end
    end
  end

  describe '.valid?' do
    subject { described_class.new({}).valid? }

    it 'params are not valid' do
      expect(subject).to be_falsey
    end
  end
end

RSpec.shared_context 'post method' do
  let(:opts) do
    {
      token: 'tokentoken',
      payload: json_payload
    }
  end

  let(:http_method) { :post }
end
