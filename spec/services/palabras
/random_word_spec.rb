require 'rails_helper'

describe Palabras::RandomPalabra do
  describe '#call' do
    subject { described_class.new.call }

    let!(:palabra) { create(:palabra) }

    it do
      expect(subject).to eq(palabra)
    end
  end
end