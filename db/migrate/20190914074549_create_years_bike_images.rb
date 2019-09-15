class CreateYearsBikeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :years_bike_images do |t|
      t.integer :bike_id
      t.text :image_id
      t.integer :display_order
      t.integer :year

      t.timestamps
    end
  end
end
