require 'rails_helper'

RSpec.describe Palabra, type: :model do
  it { is_expected.to have_db_column(:content) }
end
