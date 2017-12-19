class AddNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :ride_posts, :note, :text
  end
end
