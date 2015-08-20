class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :phone
      t.string :name

      t.timestamps
    end
    add_index :senders, :phone, unique: true
  end
end
