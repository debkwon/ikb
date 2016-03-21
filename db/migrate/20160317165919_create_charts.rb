class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :title
      t.text :description
      t.column :goal_date, :datetime
      t.timestamps null: false
    end
  end
end
