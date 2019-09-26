class AddSatisfactionLevelToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :satisfaction_level, :integer, default: 3
  end
end
