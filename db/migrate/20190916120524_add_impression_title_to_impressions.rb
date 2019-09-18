class AddImpressionTitleToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :impression_title, :string
  end
end
