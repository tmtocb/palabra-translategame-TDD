# frozen_string_literal: true

require 'rails_helper'

describe Palabras::RandomPalabra do
  describe '#call' do
    subject { described_class.new.call }

    context 'when palabra does not have any translations' do
      let!(:palabra) { create(:palabra) }

      it do
        expect(subject).to eq(nil)
      end
    end

    context 'when palabra has some translations' do
      let!(:palabra) { create(:palabra) }

      before do
        palabra.translations << create(:palabra)
      end

      it do
        expect(subject).to eq(palabra)
      end
    end
  end
end
