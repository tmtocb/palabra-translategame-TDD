# frozen_string_literal: true

class Palabra < ApplicationRecord
  validates :content, :language, presence: true
  belongs_to :language
  belongs_to :user

  has_many :translations_association, class_name: 'Translation'
  has_many :translations, through: :translations_association, source: :translated_palabra
  has_many :inverse_translations_association, class_name: 'Translation', foreign_key: 'translated_palabra_id'
  has_many :inverse_translations, through: :inverse_translations_association, source: :palabra

  paginates_per 15
end
