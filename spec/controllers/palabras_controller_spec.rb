require 'rails_helper'

describe PalabrasController do 

  describe 'GET index' do

    context 'when palabras are present' do
      it 'assigns @palabras' do
        palabra = Palabra.create(content: 'despacito')
        get :index
        expect(assigns(:palabras)).to eq([palabra])
      end

      it 'renders the index template' do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    context 'when no palabras present' do
      it 'assigns @palabras' do
        get :index
        expect(assigns(:palabras)).to eq([])
      end

      it 'renders the index template' do
        get :index
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end
  end
end