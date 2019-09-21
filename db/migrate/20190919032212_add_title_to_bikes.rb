class AddTitleToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :title, :string
  end
end
