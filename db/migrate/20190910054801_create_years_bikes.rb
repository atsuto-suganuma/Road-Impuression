class CreateYearsBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :years_bikes do |t|
      t.integer :bike_id
      t.integer :impression_id
      t.integer :bike_image_id
      t.integer :year
      t.text :year_bike_body

      t.timestamps
    end
  end
end
