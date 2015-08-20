class AddTagToProducts < ActiveRecord::Migration
  def change
    add_column :products, :tag, :string
    add_index :products, :tag, unique: true
  end
end
