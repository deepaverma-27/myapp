class AddCategoryIdToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :category_id, :integer
  end
end
