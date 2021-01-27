module Palabras
  class CheckAnswer
    def initialize(palabra, answer)
      @palabra = palabra
      @answer = answer
    end

    def call
      check_answer
    end

    private

    attr_reader :palabra, :answer

    def check_answer
      palabra.translations.where(content: answer).exists?
    end
  end
end