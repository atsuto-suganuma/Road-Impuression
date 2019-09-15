class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.integer :user_id
      t.integer :bike_id
      t.text :impression_text
      t.integer :design_evaluation
      t.integer :weight_evaluation
      t.integer :rigidity_evaluation
      t.integer :comfort_evaluation
      t.integer :cp_evaluation
      t.datetime :created_at
      t.string :updated_at
      t.string :datetime

      t.timestamps
    end
  end
end
