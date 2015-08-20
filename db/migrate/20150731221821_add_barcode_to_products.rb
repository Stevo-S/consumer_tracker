class AddBarcodeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :barcode, :string
    add_index :products, :barcode, unique: true
  end
end
