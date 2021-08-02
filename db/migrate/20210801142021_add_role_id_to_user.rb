class AddRoleIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Role_id, :integer
  end
end
