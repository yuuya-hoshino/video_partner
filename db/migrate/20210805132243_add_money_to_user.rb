class AddMoneyToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :money, :integer
  end
end
