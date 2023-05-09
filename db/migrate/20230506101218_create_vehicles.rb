class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles, id: false do |t|
      t.integer :id, null: false
      t.json :data_json

      t.timestamps
    end
    add_index :vehicles, :id, unique: true
  end
end
