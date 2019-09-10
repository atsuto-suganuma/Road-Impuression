class RemoveDetailsFromBikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :bikes, :bike_image_id, :text
    remove_column :bikes, :bike_image_no, :integer
  end
end
