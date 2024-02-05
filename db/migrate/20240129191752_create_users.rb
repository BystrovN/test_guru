class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 20, null: false
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
