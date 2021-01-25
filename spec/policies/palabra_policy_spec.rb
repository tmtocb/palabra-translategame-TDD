require 'rails_helper'

describe PalabraPolicy do
  subject { described_class }
  permissions :update?, :edit?, :destroy? do
    context 'when palabra does not belongs to user' do
      let(:palabra) { build_stubbed(:palabra) }
      let(:user) { build_stubbed(:user) }
    
      it 'denies access' do
        expect(subject).not_to permit(user, palabra)
      end
    end

    context 'when palabra belongs to user' do
      let(:palabra) { build_stubbed(:palabra, user: user) }
      let(:user) { build_stubbed(:user) }
      
      it 'grants access' do
        expect(subject).to permit(user, palabra)
      end 
    end 
  end 
end