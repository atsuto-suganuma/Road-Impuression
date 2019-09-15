class AddCountryToMakers < ActiveRecord::Migration[5.2]
  def change
    add_column :makers, :country, :string
  end
end
