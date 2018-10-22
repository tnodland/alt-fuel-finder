class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :nrel_id
      t.boolean :convenience_store

      t.timestamps
    end
  end
end
