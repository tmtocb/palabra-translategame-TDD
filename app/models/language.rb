class Language < ApplicationRecord
  validates :name, presence: true, inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name) }
end
