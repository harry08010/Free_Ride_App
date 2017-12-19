class ChangeRidePosts < ActiveRecord::Migration[5.1]
  def change
    change_column :ride_posts, :date, :date
    add_column :ride_posts, :time, :time
  end
end
