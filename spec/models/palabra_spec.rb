# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Palabra, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:content) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:translations_association).class_name('Translation') }
    it { is_expected.to have_many(:translations).through(:translations_association).source(:translated_palabra) }
    it { is_expected.to have_many(:inverse_translations_association).class_name('Translation').with_foreign_key('translated_palabra_id') }
    it { is_expected.to have_many(:inverse_translations).through(:inverse_translations_association).source(:palabra) }
  end
end
