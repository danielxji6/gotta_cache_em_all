class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.integer :level
      t.imteger :team_position

      t.timestamps null: false
    end
  end
end
