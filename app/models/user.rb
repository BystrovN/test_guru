class User < ApplicationRecord
  has_secure_password

  def tests_by_level(level)
    Test.joins('INNER JOIN results ON tests.id = results.test_id')
        .where(results: { user_id: id }, tests: { level: })
  end
end
