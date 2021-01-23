class PalabrasController < ApplicationController

  def index
    @palabras = Palabra.all
  end
end
