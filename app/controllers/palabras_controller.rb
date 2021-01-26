# frozen_string_literal: true

class PalabrasController < ApplicationController
  before_action :set_palabra, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @palabras = Palabra.page(params[:page])
  end

  def new
    @palabra = Palabra.new
    @palabra.translations.new
  end

  def create
    @palabra = Palabra.new(palabra_params)
    @palabra.user = current_user
    set_user_for_translations(@palabra)
    if @palabra.save
      redirect_to(palabras_path)
    else
      render :new
    end
  end

  def show; end

  def edit
    authorize @palabra
  end

  def update
    authorize @palabra
    @palabra.assign_attributes(palabra_params)
    set_user_for_translations(@palabra)
    if @palabra.save
      redirect_to(palabra_path(@palabra))
    else
      render :edit
    end
  end

  def destroy
    authorize @palabra
    @palabra.destroy
    redirect_to(palabras_path)
  end

  private

  def palabra_params
    params.require(:palabra).permit(:content, :language_id, translations_attributes: [:id, :content, :language_id, :_destroy])
  end

  def set_palabra
    @palabra = Palabra.find(params[:id])
  end

  def set_user_for_translations(palabra)
    palabra.translations.each do |translation|
      translation.user = current_user
    end
  end
end
