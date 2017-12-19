class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :sender_id
      t.string :receiver_id
      t.text :content
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
