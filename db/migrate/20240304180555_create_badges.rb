class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, limit: 50, null: false
      t.string :image_url

      t.timestamps
    end

    add_index :badges, :name, unique: true
  end
end
