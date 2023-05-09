class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets, id: false do |t|
      t.integer :id, null: false
      t.json :data_json

      t.timestamps
    end
    add_index :planets, :id, unique: true
  end
end
