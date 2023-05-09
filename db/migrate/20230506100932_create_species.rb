class CreateSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :species, id: false do |t|
      t.integer :id, null: false
      t.json :data_json

      t.timestamps
    end
    add_index :species, :id, unique: true
  end
end
