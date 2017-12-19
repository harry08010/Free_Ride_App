class CreateApproveRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :approve_relationships do |t|
      t.integer :approver_id
      t.integer :approved_id

      t.timestamps
    end
  add_index :approve_relationships, :approver_id
  add_index :approve_relationships, :approved_id
  add_index :approve_relationships, [:approver_id, :approved_id], unique: true
  end
end
