class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :coords
      t.string :name
      t.string :category
      t.string :image

      t.timestamps null: false
    end
  end
end
