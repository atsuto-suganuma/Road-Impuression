class CreateYearsBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :years_bikes do |t|
      t.integer :bike_id
      t.integer :years_bike_image_id
      t.integer :year
      t.text :year_bike_body
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
