# frozen_string_literal: true

FactoryBot.define do
  factory :palabra do
    content { Faker::Lorem.word }
    language
    user

    trait :with_translations do
      after(:create) do |palabra|
        palabra.translations << create_list(:palabra, 2)
      end
    end
  end
end
