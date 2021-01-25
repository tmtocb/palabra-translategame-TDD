# frozen_string_literal: true

user1 = User.create(email: 'user_1@test.com', password: 'password', password_confirmation: 'password')
user2 = User.create(email: 'user_2@test.com', password: 'password', password_confirmation: 'password')

language1 = Language.create(name: 'English')
language2 = Language.create(name: 'Polish')

5.times do
  Palabra.create(content: Faker::Lorem.word, language: language1, user: user1)
  Palabra.create(content: Faker::Lorem.word, language: language2, user: user1)
end

5.times do
  Palabra.create(content: Faker::Lorem.word, language: language1, user: user2)
  Palabra.create(content: Faker::Lorem.word, language: language2, user: user2)
end
