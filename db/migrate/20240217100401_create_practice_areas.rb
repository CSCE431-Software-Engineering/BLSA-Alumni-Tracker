class CreatePracticeAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_areas do |t|
      t.string :practice_area

      t.timestamps
    end
  end
end
