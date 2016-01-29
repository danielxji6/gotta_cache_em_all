class AddHashToEvent < ActiveRecord::Migration
  def change
    add_column :events, :hash_data, :string
  end
end
