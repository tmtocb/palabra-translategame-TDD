class PalabrasController < ApplicationController
  before_action :set_palabra, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @palabras = Palabra.all
  end

  def new
    @palabra = Palabra.new
  end

  def create
    @palabra = Palabra.new(palabra_params)
    @palabra.user = current_user
    if @palabra.save
      redirect_to(palabras_path)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @palabra.update(palabra_params)
      redirect_to(palabra_path(@palabra))
    else
      render :edit
    end
  end

  def destroy
    @palabra.destroy
    redirect_to(palabras_path)
  end

    
  private

  def palabra_params
    params.require(:palabra).permit(:content, :language_id)
  end

  def set_palabra
    @palabra = Palabra.find(params[:id])
  end
end
