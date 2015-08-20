class CreateIncomingMessages < ActiveRecord::Migration
  def change
    create_table :incoming_messages do |t|
      t.string :sender
      t.text :message

      t.timestamps
    end
    add_index :incoming_messages, :sender
    add_index :incoming_messages, :message
  end
end
