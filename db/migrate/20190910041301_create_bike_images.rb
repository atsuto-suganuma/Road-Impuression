class CreateBikeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bike_images do |t|
      t.integer :bike_id
      t.text :image_id
      t.integer :display_order
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
