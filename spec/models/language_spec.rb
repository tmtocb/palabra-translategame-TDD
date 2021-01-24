require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'columns' do  
    it { is_expected.to have_db_column(:name) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
