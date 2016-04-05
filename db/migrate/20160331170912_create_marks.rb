class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.text :description
      t.column :date, :datetime
      t.timestamps null: false
      t.references :chart, index: true, foreign_key: true
    end
  end
end
