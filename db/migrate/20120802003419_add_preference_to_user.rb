class AddPreferenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :preference, :integer

  end
end
