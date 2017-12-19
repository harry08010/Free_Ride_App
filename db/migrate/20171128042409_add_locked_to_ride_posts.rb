class AddLockedToRidePosts < ActiveRecord::Migration[5.1]
  def change
    add_column :ride_posts, :locked, :boolean
  end
end
