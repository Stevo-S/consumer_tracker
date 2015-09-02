class AddCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :references, :categories
  end
end
