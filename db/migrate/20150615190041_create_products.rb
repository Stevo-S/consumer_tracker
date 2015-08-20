class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturerProducer
      t.string :supplier
      t.string :retailer

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :manufacturerProducer
    add_index :products, :supplier
    add_index :products, :retailer
  end
end
