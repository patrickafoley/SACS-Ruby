require 'spec_helper'

describe SacsRuby::Credentials do
  context 'returns encoded credentials' do
    let(:encoded_string) do
      'VmpFNlptRnJaV2xrTVRFeE9rUkZWa05GVGxSRlVqcEZXRlE9OlptRnJaWEJoYzNNeE1URT0='
    end

    subject { described_class.new.encoded }

    it { is_expected.to eq(encoded_string) }
  end

  context 'when configuration is missing' do
    it 'raises an exception' do
      allow(SacsRuby).to receive(:configuration).and_return(nil)
      expect { subject }.to raise_error(SacsRuby::ConfigurationError)
    end
  end
end
