# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Категория 1' }, { title: 'Категория 2' }])

users = User.create!(
  [
    { username: 'admin', password_digest: 'пароль', admin: true },
    { username: 'Пользователь 1', password_digest: 'пароль' },
    { username: 'Пользователь 2', password_digest: 'пароль' }
  ]
)

tests = Test.create!(
  [
    { title: 'Тест 1', category: categories[0], author: users[0] },
    { title: 'Тест 2', level: 2, category: categories[1], author: users[0] },
    { title: 'Тест 3', category: categories[0], author: users[0] },
    { title: 'Тест 4', category: categories[0], author: users[0] }
  ]
)

questions = Question.create!(
  [
    { body: 'Вопрос 1', test: tests[0] },
    { body: 'Вопрос 2', test: tests[1] }
  ]
)

Answer.create!(
  [
    { body: 'Ответ 1', question: questions[0], correct: true },
    { body: 'Ответ 2', question: questions[0] },
    { body: 'Ответ 3', question: questions[1], correct: true },
    { body: 'Ответ 4', question: questions[1] }
  ]
)

Result.create!(
  [
    { test: tests[0], user: users[1], passed: true },
    { test: tests[1], user: users[2] },
    { test: tests[1], user: users[1] },
    { test: tests[2], user: users[1] },
    { test: tests[3], user: users[1], passed: true }
  ]
)
