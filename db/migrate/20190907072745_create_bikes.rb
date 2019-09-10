class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.integer :maker_id
      t.string :bike_name
      t.text :bike_body
      t.text :bike_image_id
      t.integer :bike_image_no
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
