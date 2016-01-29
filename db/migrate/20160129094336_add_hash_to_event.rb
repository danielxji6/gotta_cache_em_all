class AddHashToEvent < ActiveRecord::Migration
  def change
    add_column :events, :hash_data, :string
    add_column :events, :level_min, :integer
    add_column :events, :level_max, :integer
  end
end
