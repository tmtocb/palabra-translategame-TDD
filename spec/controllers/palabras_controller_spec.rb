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
    subject { post :create, params: params }

    context 'valid params' do

      let (:params) do
        { palabra: { content: 'despacito' } }
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
end