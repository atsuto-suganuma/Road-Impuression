class RemoveBikeIdFromYearsBikeImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :years_bike_images, :bike_id, :integer
  end
end
