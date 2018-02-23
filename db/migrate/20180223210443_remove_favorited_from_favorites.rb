class RemoveFavoritedFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :favorited, :integer
  end
end
