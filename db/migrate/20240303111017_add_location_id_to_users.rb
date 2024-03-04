class AddLocationIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :location, null: false, foreign_key: true
  end
end
