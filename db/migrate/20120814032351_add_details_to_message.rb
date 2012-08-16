class AddDetailsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :content, :text

    add_column :messages, :to_user_id, :integer

    add_column :messages, :from_user_id, :integer

    add_column :messages, :message_type_id, :integer

  end
end
