categories = Category.create!(
  [
    { title: 'Языки программирования' },
    { title: 'Бекенд разработка' },
    { title: 'Фронтенд разработка' },
    { title: 'DevOps' }
  ]
)

User.create!(
  [
    { email: 'user1@test.com', first_name: 'Иван', last_name: 'Иванов', password: '123123' },
    { email: 'user2@test.com', first_name: 'Петр', last_name: 'Петров', password: '123123' },
    { email: 'user3@test.com', first_name: 'Мария', last_name: 'Сидорова', password: '123123' }
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
