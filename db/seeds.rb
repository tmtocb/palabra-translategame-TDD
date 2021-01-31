# frozen_string_literal: true

user1 = User.create(email: 'mateusz.obywatel@test.com', password: 'password', password_confirmation: 'password')
user2 = User.create(email: 'tomasz.tescinski@gmail.com', password: 'password', password_confirmation: 'password')

language1 = Language.create(name: 'English')
language2 = Language.create(name: 'Polish')
language3 = Language.create(name: 'Spanish')

palabra1 = Palabra.create(content: 'dog', language: language1, user: user1)
translation1 = Palabra.create(content: 'pies', language: language2, user: user1)
translation2 = Palabra.create(content: 'perro', language: language3, user: user1)
palabra1.translations << [translation1, translation2]

palabra2 = Palabra.create(content: 'house', language: language1, user: user1)
translation3 = Palabra.create(content: 'dom', language: language2, user: user1)
translation4 = Palabra.create(content: 'casa', language: language3, user: user1)
palabra2.translations << [translation3, translation4]

palabra3 = Palabra.create(content: 'war', language: language1, user: user1)
translation5 = Palabra.create(content: 'wojna', language: language2, user: user1)
translation6 = Palabra.create(content: 'guerra', language: language3, user: user1)
palabra3.translations << [translation5, translation6]

palabra4 = Palabra.create(content: 'citizen', language: language1, user: user2)
translation7 = Palabra.create(content: 'obywatel', language: language2, user: user2)
translation8 = Palabra.create(content: 'ciudadano', language: language3, user: user2)
palabra4.translations << [translation7, translation8]

palabra5 = Palabra.create(content: 'beer', language: language1, user: user2)
translation9 = Palabra.create(content: 'piwo', language: language2, user: user2)
translation10 = Palabra.create(content: 'cerveza', language: language3, user: user2)
palabra5.translations << [translation9, translation10]

palabra6 = Palabra.create(content: 'juice', language: language1, user: user2)
translation11 = Palabra.create(content: 'sok', language: language2, user: user2)
translation12 = Palabra.create(content: 'jugo', language: language3, user: user2)
palabra6.translations << [translation11, translation12]

palabra7 = Palabra.create(content: 'school', language: language1, user: user2)
translation13 = Palabra.create(content: 'szkola', language: language2, user: user2)
translation14 = Palabra.create(content: 'colegio', language: language3, user: user2)
palabra7.translations << [translation13, translation14]

palabra8 = Palabra.create(content: 'wall', language: language1, user: user1)
translation15 = Palabra.create(content: 'sciana', language: language2, user: user1)
translation16 = Palabra.create(content: 'pared', language: language3, user: user1)
palabra8.translations << [translation15, translation16]

palabra9 = Palabra.create(content: 'desk', language: language1, user: user1)
translation17 = Palabra.create(content: 'biurko', language: language2, user: user1)
translation18 = Palabra.create(content: 'escritorio', language: language3, user: user1)
palabra9.translations << [translation17, translation18]

palabra10 = Palabra.create(content: 'chance', language: language1, user: user2)
translation19 = Palabra.create(content: 'szansa', language: language2, user: user2)
translation20 = Palabra.create(content: 'oportunidad', language: language3, user: user2)
palabra10.translations << [translation19, translation20]