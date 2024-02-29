class AddFirmTypeIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :firm_type, foreign_key: true
  end
end
