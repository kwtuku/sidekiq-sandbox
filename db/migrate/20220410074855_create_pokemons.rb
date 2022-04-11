class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.integer :pokedex_id, null: false
      t.string :identifier, null: false, index: { unique: true }
      t.integer :species_id, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.integer :base_experience, null: false
      t.integer :order, null: false, index: { unique: true }
      t.boolean :default, null: false, default: true

      t.timestamps
    end
  end
end
