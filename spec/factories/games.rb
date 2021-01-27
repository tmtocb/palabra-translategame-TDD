FactoryBot.define do
  factory :game do
    user { nil }
    good_answers_count { 1 }
    bad_answers_count { 1 }
  end
end
