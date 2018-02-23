class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :favorited, default: 0

      t.timestamps
    end
  end
end
