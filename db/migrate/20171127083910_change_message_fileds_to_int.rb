class ChangeMessageFiledsToInt < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :sender_id, :integer
    change_column :messages, :receiver_id, :integer
  end
end
