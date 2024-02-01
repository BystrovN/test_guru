class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :passed, null: false, default: false

      t.timestamps
    end
  end
end
