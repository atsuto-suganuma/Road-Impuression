class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :maker_name
      t.text :maker_image_id
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
