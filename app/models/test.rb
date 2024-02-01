class Test < ApplicationRecord
  def self.test_titles_by_category(category_title)
    joins('INNER JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
