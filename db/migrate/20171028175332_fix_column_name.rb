class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :is_driver?, :status
  end
end
