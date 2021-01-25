require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'columns' do  
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:palabras) }
  end
end
