class CreateBadgeRules < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.integer :rule_type, null: false
      t.string :description, null: false
      t.text :condition
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
