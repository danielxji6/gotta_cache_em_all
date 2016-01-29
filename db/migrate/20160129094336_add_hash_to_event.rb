class AddHashToEvent < ActiveRecord::Migration
  def change
    add_column :events, :hash_data, :string
    add_column :events, :level_mid, :integer
    add_column :events, :level_range, :integer
  end
end
