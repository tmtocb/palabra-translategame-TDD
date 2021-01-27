require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST create' do
    subject { post :create, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        let(:palabra) { create(:palabra, :with_translations) }
        let(:game) { create(:game, user: user) }
        let(:answer) { 'cat' }
        let(:params) do
          { answer: { content: answer, palabra_id: palabra.id, game_id: game.id } }
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end

        it 'calls service to check answer' do
          expect(Palabras::CheckAnswer)
            .to receive(:new)
            .with(palabra, game, answer)
            .and_call_original
          expect_any_instance_of(Palabras::CheckAnswer)
            .to receive(:call)
          subject
        end
      end
    end
  end
end
