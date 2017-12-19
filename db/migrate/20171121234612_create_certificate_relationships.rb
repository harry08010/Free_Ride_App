class CreateCertificateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :certificate_relationships do |t|
      t.integer :cer_id
      t.integer :ced_id

      t.timestamps
    end
    add_index :certificate_relationships, :cer_id
    add_index :certificate_relationships, :ced_id
    add_index :certificate_relationships, [:cer_id, :ced_id], unique: true
  end
end
