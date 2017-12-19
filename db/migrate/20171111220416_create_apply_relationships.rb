class CreateApplyRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :apply_relationships do |t|
      t.integer :applier_id
      t.integer :applied_id

      t.timestamps
    end
  
  add_index :apply_relationships, :applier_id
  add_index :apply_relationships, :applied_id
  add_index :apply_relationships, [:applier_id, :applied_id], unique: true
  end
end
