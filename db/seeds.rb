# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Категория 1' }, { title: 'Категория 2' }])

User.create!(
  [
    { email: 'user1@test.com', first_name: '1', last_name: '2', password: 123_123 },
    { email: 'user2@test.com', first_name: '2', last_name: '3', password: 123_123 }
  ]
)

admins = Admin.create!(
  [
    { admin: true, email: 'admin@test.com', first_name: 'admin', last_name: 'admin', password: 123_123 }
  ]
)

tests = Test.create!(
  [
    { title: 'Тест 1', category: categories[0], author: admins[0] },
    { title: 'Тест 2', level: 2, category: categories[1], author: admins[0] },
    { title: 'Тест 3', category: categories[0], author: admins[0] },
    { title: 'Тест 4', category: categories[0], author: admins[0] }
  ]
)

questions = Question.create!(
  [
    { body: 'Вопрос 1', test: tests[0] },
    { body: 'Вопрос 2', test: tests[1] },
    { body: 'Вопрос 3', test: tests[1] }
  ]
)

Answer.create!(
  [
    { body: 'Ответ 1', question: questions[0], correct: true },
    { body: 'Ответ 2', question: questions[0] },
    { body: 'Ответ 3', question: questions[1], correct: true },
    { body: 'Ответ 4', question: questions[1] },
    { body: 'Ответ 5', question: questions[1], correct: true },
    { body: 'Ответ 6', question: questions[2], correct: true }
  ]
)
