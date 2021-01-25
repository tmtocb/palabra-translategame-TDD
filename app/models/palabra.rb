class Palabra < ApplicationRecord
  validates :content, :language, presence: true
  belongs_to :language
  belongs_to :user
end
