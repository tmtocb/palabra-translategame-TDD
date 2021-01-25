# frozen_string_literal: true

FactoryBot.define do
  factory :palabra do
    content { 'despacito' }
    language
    user
  end
end
