class AddStuffToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
    add_column :events, :color, :string
  end
end
