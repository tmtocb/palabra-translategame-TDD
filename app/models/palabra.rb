class Palabra < ApplicationRecord
  validates :content, presence: true
end
