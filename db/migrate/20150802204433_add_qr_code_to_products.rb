class AddQrCodeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qr_code, :string
    add_index :products, :qr_code
  end
end
