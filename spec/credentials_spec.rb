require 'spec_helper'

describe Sabre::Credentials do
  context 'returns encoded credentials' do
    let(:encoded_string) do
      ''
    end

    subject { described_class.new.encoded }

    it { is_expected.to eq(encoded_string) }
  end

  context 'when configuration is missing' do
    it 'raises an exception' do
      allow(Sabre).to receive(:configuration).and_return(nil)
      expect { subject }.to raise_error(Sabre::ConfigurationError)
    end
  end
end
