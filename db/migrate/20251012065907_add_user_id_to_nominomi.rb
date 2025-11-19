class AddUserIdToNominomi < ActiveRecord::Migration[7.1]
  def change
    add_column :nominomis, :user_id, :integer
  end
end
