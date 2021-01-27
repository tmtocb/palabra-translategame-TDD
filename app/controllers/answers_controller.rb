# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    checker = Palabras::CheckAnswer.new(palabra, game, answer).call
    redirect_back(fallback_location: root_path, notice: message(checker))
  end

  private

  def word
    Palabra.find(params[:answer][:palabra_id])
  end

  def answer
    params[:answer][:content]
  end

  def game
    Game.find(params[:answer][:palabra_id])
  end

  def message(checker)
    return 'Good answer' if checker == true
    'Bad answer'
  end
end