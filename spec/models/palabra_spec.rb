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
  end
end
