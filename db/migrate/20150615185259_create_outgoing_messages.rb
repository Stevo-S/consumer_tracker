class CreateOutgoingMessages < ActiveRecord::Migration
  def change
    create_table :outgoing_messages do |t|
      t.string :recipient
      t.text :message

      t.timestamps
    end
    add_index :outgoing_messages, :recipient
    add_index :outgoing_messages, :message
  end
end
