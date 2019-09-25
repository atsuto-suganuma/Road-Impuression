class CreateMakerFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :maker_favorites do |t|
      t.integer :user_id
      t.integer :maker_id

      t.timestamps
    end
  end
end
