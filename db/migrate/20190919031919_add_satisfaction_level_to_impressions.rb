class AddSatisfactionLevelToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :satisfaction_level, :integer
  end
end
