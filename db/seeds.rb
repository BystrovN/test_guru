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
    { title: 'Тест 1', category_id: categories[0].id, author_id: users[0].id },
    { title: 'Тест 2', level: 2, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Тест 3', category_id: categories[0].id, author_id: users[0].id },
    { title: 'Тест 4', category_id: categories[0].id, author_id: users[0].id }
  ]
)

questions = Question.create!(
  [
    { body: 'Вопрос 1', test_id: tests[0].id },
    { body: 'Вопрос 2', test_id: tests[1].id }
  ]
)

Answer.create!(
  [
    { body: 'Ответ 1', question_id: questions[0].id, correct: true },
    { body: 'Ответ 2', question_id: questions[0].id },
    { body: 'Ответ 3', question_id: questions[1].id, correct: true },
    { body: 'Ответ 4', question_id: questions[1].id }
  ]
)

Result.create!(
  [
    { test_id: tests[0].id, user_id: users[1].id, passed: true },
    { test_id: tests[1].id, user_id: users[2].id },
    { test_id: tests[1].id, user_id: users[1].id },
    { test_id: tests[2].id, user_id: users[1].id },
    { test_id: tests[3].id, user_id: users[1].id, passed: true }
  ]
)
