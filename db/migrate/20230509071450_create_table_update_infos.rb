class CreateTableUpdateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :table_update_infos do |t|
      t.string :t_name, null: false
      t.timestamps
    end
    add_index :table_update_infos, :t_name, unique: true
  end
end
