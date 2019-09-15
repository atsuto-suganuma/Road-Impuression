class AddYearsBikeIdToYearsBikeImages < ActiveRecord::Migration[5.2]
  def change
    add_column :years_bike_images, :years_bike_id, :integer
  end
end
