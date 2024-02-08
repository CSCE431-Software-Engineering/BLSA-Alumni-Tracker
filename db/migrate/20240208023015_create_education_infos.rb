class CreateEducationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :education_infos do |t|
      t.string :semester
      t.integer :grad_year
      t.string :university
      t.string :degree_type

      t.timestamps
    end
  end
end
