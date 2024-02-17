class CreateAreaJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :area_joins do |t|
      t.string :practice_area
      t.string :user

      t.timestamps
    end
  end
end
