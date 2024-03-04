class RemoveLocationFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :location, :string
    remove_column :users, :Location, :string
  end
end
