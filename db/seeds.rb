require_relative '../app/helpers/rule_types_helper'

Category.destroy_all
User.destroy_all
Admin.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

categories = Category.create!(
  [
    { title: 'Языки программирования' },
    { title: 'Бекенд разработка' },
    { title: 'Фронтенд разработка' },
    { title: 'DevOps' }
  ]
)

admins = Admin.create!(
  [
    { admin: true, email: ENV.fetch('ADMIN_EMAIL', nil), first_name: 'admin', last_name: 'admin', password: '123123' }
  ]
)

tests = Test.create!(
  [
    { title: 'Python Basics', category: categories[0], author: admins[0] },
    { title: 'Ruby Fundamentals', category: categories[1], author: admins[0] },
    { title: 'JavaScript ES6+', category: categories[2], author: admins[0] },
    { title: 'Introduction to DevOps', category: categories[3], author: admins[0] }
  ]
)

questions = Question.create!(
  [
    { body: 'Как объявить функцию в Python?', test: tests[0] },
    { body: 'Как объявить массив в Ruby?', test: tests[1] },
    { body: 'Что такое замыкание в JavaScript?', test: tests[2] },
    { body: 'Что такое контейнеризация?', test: tests[3] },
    { body: 'Что такое объектно-ориентированное программирование?', test: tests[0] },
    { body: 'Какие базовые типы данных существуют в Ruby?', test: tests[1] },
    { body: 'Что такое DOM?', test: tests[2] },
    { body: 'Какие инструменты чаще всего используются в DevOps?', test: tests[3] }
  ]
)

Answer.create!(
  [
    { body: 'def my_function():', question: questions[0], correct: true },
    { body: 'function myFunction() {}', question: questions[0] },
    { body: 'define my_function()', question: questions[0] },
    { body: 'Array.new', question: questions[1], correct: true },
    { body: 'Arrays', question: questions[1] },
    { body: 'Lists', question: questions[1] },
    { body: 'Это функция, которая ссылается на переменные из внешней функции', question: questions[2], correct: true },
    { body: 'Это функция, которая вызывается внутри другой функции', question: questions[2] },
    { body: 'Это функция, которая работает только с замыканиями', question: questions[2] },
    { body: 'Это процесс упаковки приложения со всем его окружением и зависимостями', question: questions[3],
      correct: true },
    { body: 'Это процесс разворачивания приложения на сервере', question: questions[3] },
    { body: 'Это процесс автоматизации тестирования приложения', question: questions[3] },
    { body: 'Парадигма программирования, в которой основными концепциями являются объекты и классы',
      question: questions[4], correct: true },
    { body: 'Методология программирования, ориентированная на объекты', question: questions[4] },
    { body: 'Способ программирования, при котором данные представлены в виде объектов',
      question: questions[4] },
    { body: 'Integer, String, Array, Hash', question: questions[5], correct: true },
    { body: 'Number, Text, List, Dictionary', question: questions[5] },
    { body: 'Int, Str, Arr, Map', question: questions[5] },
    { body: 'Document Object Model – объектная модель документа', question: questions[6], correct: true },
    { body: 'Data Object Model – модель объектов данных', question: questions[6] },
    { body: 'Document Oriented Methodology – методология ориентированная на документы',
      question: questions[6] },
    { body: 'Docker, Kubernetes, Ansible, Terraform', question: questions[7], correct: true },
    { body: 'Git, Jenkins, Puppet, Chef', question: questions[7] },
    { body: 'SQL, NoSQL, MongoDB, Redis', question: questions[7] }
  ]
)

categories.each do |category|
  Badge.create(
    name: "Мастер категории #{category.title}",
    image_url: 'https://cdn.pixabay.com/photo/2013/07/12/15/55/laurel-wreath-150577_1280.png',
    description: "Пройти все тесты категории #{category.title}",
    rule_type: RuleTypesHelper::CATEGORY_COMPLETION,
    condition: category.id
  )
end

Badge.create(
  name: 'С первой попытки',
  image_url: 'https://cdn.pixabay.com/photo/2014/03/25/16/32/laurel-wreath-297311_1280.png',
  description: 'Пройти тест с первой попытки',
  rule_type: RuleTypesHelper::FIRST_ATTEMPT,
  condition: nil
)

Badge.create(
  name: 'Мастер уровня 1',
  image_url: 'https://cdn.pixabay.com/photo/2013/07/13/09/51/fame-156160_1280.png',
  description: 'Пройти все тесты уровня 1',
  rule_type: RuleTypesHelper::LEVEL_COMPLETION,
  condition: 1
)
