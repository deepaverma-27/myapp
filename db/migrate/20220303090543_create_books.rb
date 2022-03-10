class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :auther_name
      t.integer :price
      t.timestamps
    end
  end
end
