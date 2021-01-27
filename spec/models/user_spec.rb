# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
  end

  describe '#associations' do
    it { is_expected.to have_many(:palabras) }
    it { is_expected.to have_many(:games) }
  end

  describe '.secret_email' do
    subject { user.secret_email }
    let(:user) { build_stubbed(:user, email: 'john.test@example.com') }
    it { is_expected.to eq('john.t###@example.com') }
  end
end
