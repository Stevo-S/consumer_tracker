class RenameProductManufactureColumn < ActiveRecord::Migration
  def change
    rename_column :products, :manufacturerProducer, :manufacturer
  end
end
