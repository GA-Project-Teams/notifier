class RenameToUserIdToUserId < ActiveRecord::Migration
  def up
    rename_column :messages, :to_user_id, :user_id
  end

  def down
    rename_column :messages, :user_id, :to_user_id
  end
end
