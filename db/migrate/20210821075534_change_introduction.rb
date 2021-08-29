class ChangeIntroduction < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :introduction, :string, limit: 500
  end
end
