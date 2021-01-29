# frozen_string_literal: true

module Palabras
  class RandomPalabra
    def call
      get_random_palabra
    end

    private

    def get_random_palabra
      Palabra.joins(:translations).order(Arel.sql('Random()')).limit(1).first
    end
  end
end
