class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :name
      t.timestamps null: false
      t.references :category, index: true, foreign_key: true
    end
  end
end
