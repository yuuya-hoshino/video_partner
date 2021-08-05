class AddSubgenreIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subgenre_id, :integer
  end
end
