class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.integer :maker_id
      t.string :bike_name
      t.string :bike_name_kana
      t.text :bike_image_id
      t.integer :genre
      t.integer :grade
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
