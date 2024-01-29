class AddDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tests, :level, 1

    change_column_default :users, :admin, false

    change_column_default :answers, :correct, false
  end
end
