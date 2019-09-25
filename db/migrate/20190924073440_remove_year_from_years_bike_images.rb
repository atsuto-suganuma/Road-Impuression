class RemoveYearFromYearsBikeImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :years_bike_images, :year, :integer
  end
end
