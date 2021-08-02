class RenameRoleIdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Role_id, :role_id
  end
end
