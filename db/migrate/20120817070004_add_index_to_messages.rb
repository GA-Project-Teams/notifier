class AddIndexToMessages < ActiveRecord::Migration
  def up
    add_index :messages, :user_id
    add_index :messages, :from_user_id
  end
  
  def down
    remove_index :messages, :user_id
    remove_index :message, :from_user_id
  end
end
