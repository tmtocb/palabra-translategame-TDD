class Palabra < ApplicationRecord
  validates :content, :language, presence: true
  belongs_to :language
  belongs_to :user

  paginates_per 15
end
