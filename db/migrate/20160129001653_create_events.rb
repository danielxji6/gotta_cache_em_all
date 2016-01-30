class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :coords
      t.string :name
      t.string :category
      t.string :image
      t.integer :dex_number
      t.text :description

      t.timestamps null: false
    end
  end
end
