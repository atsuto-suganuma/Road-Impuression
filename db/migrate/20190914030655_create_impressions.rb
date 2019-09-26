class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.integer :user_id
      t.integer :bike_id
      t.text :impression_text
      t.integer :design_evaluation, defaule: 3
      t.integer :weight_evaluation, default: 3
      t.integer :rigidity_evaluation, default: 3
      t.integer :comfort_evaluation, default: 3
      t.integer :cp_evaluation, default: 3
      t.datetime :created_at
      t.string :updated_at
      t.string :datetime

      t.timestamps
    end
  end
end
