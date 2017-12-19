class CreateRidePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :ride_posts do |t|
      t.string :starting_point
      t.string :destination
      t.integer :available_seat_number
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ride_posts, [:user_id, :created_at]
  end
end
