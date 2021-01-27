module Palabras
  class CheckAnswer
    def initialize(palabra, game, answer)
      @palabra = palabra
      @game = game
      @answer = answer
    end

    def call
      update_game_stats(success: good_answer?)
      good_answer?
    end

    private

    attr_reader :palabra, :game, :answer

    def good_answer?
      @good_answer ||= palabra.translations.where(content: answer).exists?
    end

    def update_game_stats(success:)
      return game.increment!(:good_answers_count) if success == true
      game.increment!(:bad_answers_count)
    end
  end
end