class PalabrasController < ApplicationController

  def index
    @palabras = Palabra.all
  end

  def new
    @palabra = Palabra.new
  end

  def create
    @palabra = Palabra.new(palabra_params)
    if @palabra.save
      redirect_to(palabras_path)
    else
      render :new
    end
  end

  def show
    @palabra = Palabra.find(params[:id])
  end

  def edit
    @palabra = Palabra.find(params[:id])
  end

  def update
    @palabra = Palabra.find(params[:id])
    if @palabra.update(palabra_params)
      redirect_to(palabra_path(@palabra))
    else
      render :edit
    end
  end

  def destroy
    @palabra = Palabra.find(params[:id])
    @palabra.destroy
    redirect_to(palabras_path)
  end

    
  private

  def palabra_params
    params.require(:palabra).permit(:content, :language_id)
  end
end
