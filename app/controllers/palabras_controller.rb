class PalabrasController < ApplicationController

  def index
    @palabras = Palabra.all
  end

  def new
    @palabra = Palabra.new
  end
end
