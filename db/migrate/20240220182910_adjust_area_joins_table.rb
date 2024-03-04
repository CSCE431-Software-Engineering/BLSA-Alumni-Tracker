class AdjustAreaJoinsTable < ActiveRecord::Migration[7.0]
  def change
 
    
    remove_column :area_joins, :user, :string
    remove_column :area_joins, :practice_area, :string


    add_column :area_joins, :user_id, :bigint
    add_column :area_joins, :practice_area_id, :bigint

    # Optionally, add indexes for these new columns to improve query performance
    add_index :area_joins, :user_id
    add_index :area_joins, :practice_area_id

    add_foreign_key :area_joins, :users, column: :user_id
    add_foreign_key :area_joins, :practice_areas, column: :practice_area_id
  end
end
