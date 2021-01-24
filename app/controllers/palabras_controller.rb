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
      redirect_to(root_path)
    else
      render :new
    end
  end

  def show
  end
    
  private

  def palabra_params
    params.require(:palabra).permit(:content)
  end
end
