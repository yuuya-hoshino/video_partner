class AddGenreIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :genre_id, :integer
  end
end
