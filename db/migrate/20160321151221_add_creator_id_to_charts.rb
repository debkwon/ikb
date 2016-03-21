class AddCreatorIdToCharts < ActiveRecord::Migration
  def self.up
    add_column :charts, :creator_id, :integer
  end
  def self.down
    remove_column :charts, :creator_id, :integer
  end
end
