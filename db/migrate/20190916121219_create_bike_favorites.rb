class CreateBikeFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_favorites do |t|
      t.integer :bike_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
