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

      it 'expect success http response' do
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

      it 'expect success http response' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'assigns @palabra' do
      expect(assigns(:palabra)).to be_a_new(Palabra)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'expect success http response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    let!(:language) { create(:language) }
    subject { post :create, params: params }

    context 'valid params' do

      let (:params) do
        { palabra: { content: 'despacito', language_id: language.id } }
      end

      it 'creates new palabra' do
        expect { subject }.to change(Palabra, :count).from(0).to(1)
      end
    end

    context 'invalid params' do

      let (:params) do
        { palabra: { content: '' } }
      end

      it 'does not create new word' do
        expect { subject }.not_to change(Palabra, :count)
        expect(response).to render_template(:new)
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
    before { get :edit, params: params }

    let(:params) do
       { id: palabra.id }
    end

    let!(:palabra) { create(:palabra) }

    it 'assigns @palabra' do
      expect(assigns(:palabra)).to eq(palabra)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let!(:palabra) { create(:palabra, content: 'despacito', language: language_1) }
    let!(:language_1) { create(:language, name: 'English') }
    let!(:language_2) { create(:language, name: 'Polish') }

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

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:palabra) { create(:palabra) }

    context 'valid params' do
      let (:params) do
      { id: palabra.id }
      end

      it 'deletes palabra' do
        expect { subject}.to change(Palabra, :count).from(1).to(0)
      end
    end
  end
end