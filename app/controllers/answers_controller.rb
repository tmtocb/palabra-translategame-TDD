class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    authorize(game, :access?)
    checker = Palabras::CheckAnswer.new(palabra, game, answer)
    checker.call
    redirect_back(fallback_location: root_path)
  end

  private

  def palabra
    Palabra.find(params[:answer][:palabra_id])
  end

  def answer
    params[:answer][:content]
  end

  def game
    Game.find(params[:answer][:game_id])
  end
end