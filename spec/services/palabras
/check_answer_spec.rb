require 'rails_helper'

describe Palabras::CheckAnswer do
  describe '#call' do
    subject { described_class.new(palabra, answer).call }

    context 'when user provided good answer' do
      let(:palabra) { create(:palabra, :with_translations) }
      let(:answer) { palabra.translations.first.content }

      it { is_expected.to eq(true) }
    end

    context 'when user provided bad answer' do
      let(:palabra) { create(:palabra, :with_translations) }
      let(:answer) { 'qwe123' }

      it { is_expected.to eq(false) }
    end
  end
end