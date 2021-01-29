# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Translation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:palabra) }
    it { is_expected.to belong_to(:translated_palabra).class_name('Palabra') }
  end
end
