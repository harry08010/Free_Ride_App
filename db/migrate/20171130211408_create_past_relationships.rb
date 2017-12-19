class CreatePastRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :past_relationships do |t|
      t.integer :driver_id
      t.integer :passenger_id

      t.timestamps
    end
    add_index :past_relationships, :driver_id
    add_index :past_relationships, :passenger_id
    add_index :past_relationships, [:driver_id, :passenger_id], unique: true
  end
end
