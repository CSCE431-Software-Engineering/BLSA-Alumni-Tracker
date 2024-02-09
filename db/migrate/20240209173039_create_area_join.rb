class CreateAreaJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :area_joins do |t|
      t.string :user
      t.string :practice_area

      t.timestamps
    end
  end
end
