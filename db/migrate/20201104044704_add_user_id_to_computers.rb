class AddUserIdToComputers < ActiveRecord::Migration[6.0]
  def change
    add_column :computers, :user_id, :integer
  end
end
