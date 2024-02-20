class AdjustAreaJoinsTable < ActiveRecord::Migration[7.0]
  def change
    # Assuming 'user' and 'practice_area' are not needed and can be safely removed.
    # If they contain important data, consider a strategy to migrate that data before dropping.
    remove_column :area_joins, :user, :string
    remove_column :area_joins, :practice_area, :string

    # Add the new integer columns for storing foreign keys
    add_column :area_joins, :user_id, :bigint
    add_column :area_joins, :practice_area_id, :bigint

    # Optionally, add indexes for these new columns to improve query performance
    add_index :area_joins, :user_id
    add_index :area_joins, :practice_area_id

    # If your application uses foreign key constraints for data integrity,
    # add foreign key constraints to these columns
    add_foreign_key :area_joins, :users, column: :user_id
    add_foreign_key :area_joins, :practice_areas, column: :practice_area_id
  end
end
