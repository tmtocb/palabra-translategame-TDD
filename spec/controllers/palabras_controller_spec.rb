# frozen_string_literal: true

require 'rails_helper'

describe PalabrasController do
  describe 'GET index' do
    before { get :index }

    context 'when palabras are present' do
      let!(:palabra) { create(:palabra) }

      it 'assigns @palabras' do
        expect(assigns(:palabras)).to eq([palabra])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when no palabras present' do
      it 'assigns @palabras' do
        expect(assigns(:palabras)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET new' do
    context 'when user is signed in' do
      let(:user) { create(:user) }
      before do
        sign_in(user)
        get :new
      end

      it 'assigns @palabra' do
        expect(assigns(:palabra)).to be_a_new(Palabra)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      it 'assigns @palabra' do
        expect(assigns(:palabra)).to eq(nil)
      end

      it 'renders the new template' do
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        let!(:language_1) { create(:language) }
        let(:params) do
          { palabra: { content: 'despacito', language_id: language_1.id } }
        end

        it 'creates new palabra' do
          expect { subject }.to change(Palabra, :count).from(0).to(1)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end

        context 'when some translation is present' do
          let!(:language_2) { create(:language, :polish) }
          let(:params) do
            {
              palabra:
                {
                  content: 'despacito',
                  language_id: language_1.id,
                  translations_attributes:
                    {
                      '1541932687026' =>
                        {
                          content: 'bailando',
                          language_id: language_2.id,
                          _destroy: false
                        }
                    }
                }
            }
          end

          it 'creates two words' do
            expect { subject }.to change(Palabra, :count).from(0).to(2)
          end

          it 'creates translation for first palabra' do
            subject
            expect(Palabra.first.reload.translations.count).to eq(1)
          end
        end
      end

      context 'invalid params' do
        let(:params) do
          { palabra: { content: '' } }
        end

        it 'does not create new palabra' do
          expect { subject }.not_to change(Palabra, :count)
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let!(:language) { create(:language) }
        let(:params) do
          { palabra: { content: 'despacito', language_id: language.id } }
        end

        it 'does not create new palabra' do
          expect { subject }.not_to change(Palabra, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { palabra: { content: '' } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Palabra, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }
    let(:params) do
      { id: palabra.id }
    end
    let!(:palabra) { create(:palabra) }

    it 'assigns @palabra' do
      expect(assigns(:palabra)).to eq(palabra)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    subject { get :edit, params: params }
    let(:params) do
      { id: palabra.id }
    end
    let!(:palabra) { create(:palabra, user: user) }
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in(user)
        subject
      end

      it 'assigns @palabra' do
        expect(assigns(:palabra)).to eq(palabra)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end
    end

    context 'when user is NOT signed in' do
      it 'does not assign @palabra' do
        expect(assigns(:palabra)).to eq(nil)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let!(:palabra) { create(:palabra, user: user, content: 'despacito', language: language_1) }
    let!(:language_1) { create(:language, name: 'English') }
    let!(:language_2) { create(:language, name: 'Polish') }
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in(user)
      end

      context 'valid params' do
        let(:params) do
          { id: palabra.id, palabra: { content: 'bailando', language_id: language_2.id } }
        end

        it 'updates palabra' do
          expect { subject }
            .to change { palabra.reload.content }
            .from('despacito')
            .to('bailando')
            .and change { palabra.reload.language }
            .from(language_1)
            .to(language_2)
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: palabra.id, palabra: { content: '' } }
        end

        it 'does not update palabra' do
          expect { subject }.not_to change { palabra.reload.content }
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { id: palabra.id, palabra: { content: 'bailando', language_id: language_2.id } }
        end

        it 'does not update palabra' do
          expect { subject }.not_to change { palabra.reload.content }
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: palabra.id, palabra: { content: '' } }
        end

        it 'does not update palabra' do
          expect { subject }.not_to change { palabra.reload.content }
        end
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:palabra) { create(:palabra, user: user) }
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        sign_in(user)
      end

      context 'valid params' do
        let(:params) do
          { id: palabra.id }
        end

        it 'deletes palabra' do
          expect { subject }.to change(Palabra, :count).from(1).to(0)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { id: palabra.id }
        end

        it 'does not delete palabra' do
          expect { subject }.not_to change(Palabra, :count)
        end
      end
    end
  end
end
